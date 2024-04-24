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
    
    func findTerm() async {
        Task { @MainActor in
            let result = try? await service.findAnime(search: search)
            self.searchResult = result ?? []
        }
    }
}
