//
//  HomeViewViewModel.swift
//  AniList
//
//  Created by Luann Marques Luna on 23/04/24.
//

import Foundation
import Combine

final class HomeViewViewModel: ObservableObject {
    @Published var animes: [ShortAnimeViewModel] = []
    @Published var searchResult: [ShortAnimeViewModel] = []
    @Published var isLoading: Bool = false
    @Published var search: String = ""
    
    private var subscriptions = Set<AnyCancellable>()
    
    private let service: APIService
    
    init(service: APIService) {
        self.service = service
        $search
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink(receiveValue: { [weak self] t in
                guard !t.isEmpty, let self else { return }
                Task {
                    await self.findTerm(term: t)
                }
            } )
            .store(in: &subscriptions)
    }
    
    func fetchAllAnimes() async {
        Task { @MainActor in
            isLoading = true
            let animes = try? await service.fetchAllAnimes()
            self.animes += animes ?? []
            isLoading = false
        }
    }
    
    func loadMoreItemsIfNeed(_ item: ShortAnimeViewModel) {
        Task {
            let thresholdIndex = animes.index(animes.endIndex, offsetBy: -5)
            if animes.firstIndex(where: { $0.id == item.id }) == thresholdIndex {
                await fetchAllAnimes()
            }
        }
    }
    
    func findTerm(term: String) async {
        Task { @MainActor in
            let result = try? await service.searchAnime(search: term)
            self.searchResult = result ?? []
        }
    }
    
    func findMoreItemsIfNeed(_ item: ShortAnimeViewModel) {
        Task {
            let thresholdIndex = searchResult.index(searchResult.endIndex, offsetBy: -5)
            if searchResult.firstIndex(where: { $0.id == item.id }) == thresholdIndex {
                await fetchMoreItems()
            }
        }
    }
    
    func fetchMoreItems() async {
        Task { @MainActor in
            let result = try? await service.findAnime(search: search)
            self.searchResult += result ?? []
        }
    }
}
