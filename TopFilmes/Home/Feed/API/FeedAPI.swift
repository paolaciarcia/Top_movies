//
//  FeedAPI.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 28/08/23.
//

import Foundation

protocol FeedAPIProtocol {
    func fetchTrendingMovies(completion: @escaping (Result<TrendingMovies, ClientError>) -> Void)
}

final class FeedAPI: FeedAPIProtocol {
    private let client: ClientProtocol

    init(client: ClientProtocol) {
        self.client = client
    }

    static func make() -> FeedAPI {
        return FeedAPI(client: ClientFactory.create())
    }

    func fetchTrendingMovies(completion: @escaping (Result<TrendingMovies, ClientError>) -> Void) {
        let url = FeedEndpoints.trendingMovies.url
        let headers = [
            "Authorization": Secrets.authHeader
        ]

        client.request(url: url,
                       method: .get,
                       headers: headers, parameters: [:], completion: completion)
    }
}
