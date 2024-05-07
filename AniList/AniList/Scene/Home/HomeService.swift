//
//  APIService.swift
//  AniList
//
//  Created by Luann Marques Luna on 23/04/24.
//

import Apollo
import Foundation

final class HomeService {
    private let apollo: ApolloClientProtocol
    private var page: Int = 1
    private var searchPage: Int = 1
    private var hasNextPage: Bool = true
    private var hasNextPageSearch: Bool = true
    
    init(apollo: ApolloClientProtocol = ApolloClient(url: Constants.url)) {
        self.apollo = apollo
    }
    
    func fetchAllAnimes() async throws -> [ShortAnimeViewModel] {
        guard hasNextPage else { return [] }
        return try await withUnsafeThrowingContinuation { continuation in
            fetchAllAnimes() { result in
                switch result {
                case let .success(response):
                    continuation.resume(returning: response)
                case let .failure(failure):
                    continuation.resume(throwing: failure)
                }
            }
        }
    }
    
    func searchAnime(search: String) async throws -> [ShortAnimeViewModel] {
        searchPage = 1
        hasNextPageSearch = true
        return try await findAnime(search: search)
    }
    
    func findAnime(search: String) async throws -> [ShortAnimeViewModel] {
        guard hasNextPageSearch else { return [] }
        return try await withCheckedThrowingContinuation { continuation in
            findAnimes(search: search) { result in
                switch result {
                case .success(let success):
                    continuation.resume(returning: success)
                case .failure(let failure):
                    continuation.resume(throwing: failure)
                }
            }
        }
    }
}

private
extension HomeService {
    func fetchAllAnimes(completion: @escaping (Result<[ShortAnimeViewModel], APIError>) -> Void) {
        apollo.fetch(
            query: AllAnnimesQuery(
                page: page
            ),
            cachePolicy: .returnCacheDataElseFetch,
            contextIdentifier: UUID(),
            queue: .global()
        ) { [weak self] result in
            switch result {
            case let .success(graphqlResponse):
                let medias: [BaseAnimeInfo] = (graphqlResponse.data?.page?.media?.compactMap { $0 })?.map { $0.fragments.baseAnimeInfo } ?? []
                self?.hasNextPage = graphqlResponse.data?.page?.pageInfo?.fragments.pagination.hasNextPage ?? false
                if self?.hasNextPage ?? false {
                    self?.page += 1
                }
                let animes = medias.map { ShortAnimeViewModel(anime: $0) }
                completion(.success(animes))
            case let .failure(error):
                print(error.localizedDescription)
                completion(.failure(.generic(error)))
            }
        }
    }
    
    func findAnimes(search: String, completion: @escaping (Result<[ShortAnimeViewModel], APIError>) -> Void) {
        apollo.fetch(
            query: FindAnimeQuery(
                search: search,
                page: searchPage
            ),
            cachePolicy: .returnCacheDataElseFetch,
            contextIdentifier: UUID(),
            queue: .global()
        ) { [weak self] result in
            switch result {
            case let .success(graphqlResponse):
                let medias: [BaseAnimeInfo] = (graphqlResponse.data?.page?.media?.compactMap { $0 })?.map { $0.fragments.baseAnimeInfo } ?? []
                self?.hasNextPageSearch = graphqlResponse.data?.page?.pageInfo?.fragments.pagination.hasNextPage ?? false
                if self?.hasNextPageSearch ?? false {
                    self?.searchPage += 1
                }
                let animes = medias.map { ShortAnimeViewModel(anime: $0) }
                completion(.success(animes))
            case let .failure(error):
                print(error.localizedDescription)
                completion(.failure(.generic(error)))
            }
        }
    }
}
