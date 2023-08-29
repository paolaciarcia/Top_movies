//
//  FeedService.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 28/08/23.
//

import Foundation

protocol FeedTrendingMoviesServiceDelegate: AnyObject {
    func didReceive(movies: [Movie])
    func didReceiveError()
    func didReceiveEmptyResult()
}

protocol FeedTrendingMoviesServiceProtocol {
    var delegate: FeedTrendingMoviesServiceDelegate? { get set }
    func fetchMoviesRetry()
    func fetchMovies()
}

final class FeedService {
    private let api: FeedAPIProtocol
    private var lastQuery: String?
    weak var delegate: FeedTrendingMoviesServiceDelegate?

    init(api: FeedAPIProtocol = FeedAPI.make()) {
        self.api = api
    }
}

extension FeedService: FeedTrendingMoviesServiceProtocol {
    func fetchMoviesRetry() {
        guard let query = lastQuery else { return }
        lastQuery = query

    }

    func fetchMovies() {
        api.fetchTrendingMovies { [weak self] result in
            switch result {
            case let .success(success):
                print("SUCCESS:\(success)")
            case let .failure(failure):
                print("FAILURE: \(failure)")
            }
        }
    }
}
