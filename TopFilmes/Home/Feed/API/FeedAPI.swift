//
//  FeedAPI.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 28/08/23.
//

import Foundation

protocol FeedAPIProtocol {
    func fetchPopularMovies(completion: @escaping (Result<PopularMovies, ClientError>) -> Void)
    func fetchTopRatedMovies(completion: @escaping (Result<PopularMovies, ClientError>) -> Void)
    func fetchTrendingMovies(completion: @escaping (Result<PopularMovies, ClientError>) -> Void)
}

final class FeedAPI: FeedAPIProtocol {
    private let client: ClientProtocol

    init(client: ClientProtocol) {
        self.client = client
    }

    static func make() -> FeedAPI {
        return FeedAPI(client: ClientFactory.create())
    }

    func fetchPopularMovies(completion: @escaping (Result<PopularMovies, ClientError>) -> Void) {
        let url = FeedEndpoints.popularMovies.url
        let headers = [
            "Authorization": Secrets.authHeader
        ]

        client.request(url: url,
                       method: .get,
                       headers: headers, parameters: [:], completion: completion)
    }

    func fetchTopRatedMovies(completion: @escaping (Result<PopularMovies, ClientError>) -> Void) {
        let url = FeedEndpoints.topRatedMovies.url
        let headers = [
            "Authorization": Secrets.authHeader
        ]
        client.request(url: url,
                       method: .get,
                       headers: headers, parameters: [:],
                       completion: completion)
    }

    func fetchTrendingMovies(completion: @escaping (Result<PopularMovies, ClientError>) -> Void) {
        let url = FeedEndpoints.trendingMovies.url
        let headers = [
            "Authorization": Secrets.authHeader
        ]
        client.request(url: url,
                       method: .get,
                       headers: headers,
                       parameters: [:],
                       completion: completion)
    }
}
