//
//  APIService.swift
//  AniList
//
//  Created by Luann Marques Luna on 23/04/24.
//

import Apollo
import Foundation

final class HomeService {
    private let apollo: ApolloClient
    private var page: Int = 1
    private var searchPage: Int = 1
    private var hasNextPage: Bool = true
    private var hasNextPageSearch: Bool = true
    
    init(apollo: ApolloClient = ApolloClient(url: Constants.url)) {
        self.apollo = apollo
    }
    
    func fetchAllAnimes() async throws -> [ShortAnimeViewModel] {
        guard hasNextPage else { return [] }
        let response = try await apollo.fetch(query: AllAnnimesQuery(page: page))
        let medias: [BaseAnimeInfo] = (response.data?.page?.media?.compactMap { $0 })?.map { $0.fragments.baseAnimeInfo } ?? []
        hasNextPage = response.data?.page?.pageInfo?.fragments.pagination.hasNextPage ?? false
        if hasNextPage {
            page += 1
        }
        let animes = medias.map { ShortAnimeViewModel(anime: $0) }
        return animes
    }
    
    func searchAnime(search: String) async throws -> [ShortAnimeViewModel] {
        searchPage = 1
        hasNextPageSearch = true
        return try await findAnime(search: search)
    }
    
    func findAnime(search: String) async throws -> [ShortAnimeViewModel] {
        let result = try await apollo.fetch(
            query: FindAnimeQuery(
                search: search,
                page: searchPage
            )
        )
        let medias: [BaseAnimeInfo] = (result.data?.page?.media?.compactMap { $0 })?.map { $0.fragments.baseAnimeInfo } ?? []
        hasNextPageSearch = result.data?.page?.pageInfo?.fragments.pagination.hasNextPage ?? false
        if hasNextPageSearch {
            searchPage += 1
        }
        let animes = medias.map { ShortAnimeViewModel(anime: $0) }
        return animes
    }
}
