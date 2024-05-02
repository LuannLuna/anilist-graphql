//
//  DetailViewViewModel.swift
//  AniList
//
//  Created by Luann Marques Luna on 26/04/24.
//

import Foundation

final class DetailViewViewModel: ObservableObject {
    @Published var anime: DetailAnimeViewModel?
    @Published var isLoading: Bool = false
    private var id: Int
    
    private let service: DetailViewService
    var called: Bool = false
    
    init(id: Int, service: DetailViewService) {
        self.id = id
        self.service = service
    }
    
    func fetchAnime() async {
        guard !called else { return }
        Task { @MainActor in
            isLoading = true
            anime = try? await service.fetchAnime(id: id)
            isLoading = false
            called = true
        }
    }
}

#if DEBUG
extension DetailViewViewModel {
    convenience init(anime: DetailAnimeViewModel) {
        self.init(id: 1, service: DetailViewService())
        self.anime = anime
    }
}
#endif
