//
//  DetailViewService.swift
//  AniList
//
//  Created by Luann Marques Luna on 26/04/24.
//

import Apollo

final class DetailViewService {
    private let apollo: ApolloClient
    
    init(apollo: ApolloClient = ApolloClient(url: Constants.url)) {
        self.apollo = apollo
    }
    
    func fetchAnime(id: Int) async throws -> DetailAnimeViewModel {
        let response = try await apollo.fetch(query: FetchDetailQuery(mediaId: id))
        guard
            let baseInfo = response.data?.page?.media?.first??.fragments.baseAnimeInfo,
            let detail = response.data?.page?.media?.first??.fragments.detailAnimeInfo
        else {
            throw APIError.notData
        }
        let detailViewModel = DetailAnimeViewModel(anime: ShortAnimeViewModel(anime: baseInfo), detail: detail)
        return detailViewModel
    }
}
