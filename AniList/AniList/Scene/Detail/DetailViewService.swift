//
//  DetailViewService.swift
//  AniList
//
//  Created by Luann Marques Luna on 26/04/24.
//

import Apollo

final class DetailViewService {
    private let apollo: ApolloClientProtocol
    
    init(apollo: ApolloClientProtocol = ApolloClient(url: Constants.url)) {
        self.apollo = apollo
    }
    
    func fetchAnime(id: Int) async throws -> DetailAnimeViewModel {
        try await withUnsafeThrowingContinuation { continuation in
            fetchAnime(id: id) { result in
                switch result {
                case let .success(response):
                    continuation.resume(returning: response)
                case let .failure(failure):
                    continuation.resume(throwing: failure)
                }
            }
        }
    }
}

private
extension DetailViewService {
    func fetchAnime(id: Int, completion: @escaping (Result<DetailAnimeViewModel, APIError>) -> Void) {
        let result = apollo.fetch(
            query: FetchDetailQuery(
                mediaId: id
            ),
            cachePolicy: .returnCacheDataElseFetch,
            contextIdentifier: nil,
            queue: .global()
        ) { [weak self] result in
            switch result {
            case let .success(graphqlResponse):
                print(graphqlResponse)
                guard
                    let baseInfo = graphqlResponse.data?.page?.media?.first??.fragments.baseAnimeInfo,
                    let detail = graphqlResponse.data?.page?.media?.first??.fragments.detailAnimeInfo
                else {
                    completion(.failure(.notData))
                    return
                }
                let response = DetailAnimeViewModel(anime: ShortAnimeViewModel(anime: baseInfo), detail: detail)
                completion(.success(response))
            case let .failure(error):
                print(error.localizedDescription)
                completion(.failure(.generic(error)))
            }
        }
    }
}
