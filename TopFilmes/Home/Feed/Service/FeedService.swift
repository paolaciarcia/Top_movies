//
//  FeedService.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 28/08/23.
//

import Foundation

protocol FeedPopularMoviesServiceDelegate: AnyObject {
    func didReceivePopular(movies: PopularMovies)
    func didTopRated(movies: PopularMovies)
    func didReceiveTrending(movies: PopularMovies)
    func didReceiveError(ofType: ClientError)
    func didReceiveEmptyResult()
    func didReceiveLoading()
}

protocol FeedPopularMoviesServiceProtocol {
    var delegate: FeedPopularMoviesServiceDelegate? { get set }
    func fetchMoviesRetry()
    func fetchPopularMovies()
    func fetchTopRatedMovies()
    func fetchTrendingMovies()
}

final class FeedService {
    private let api: FeedAPIProtocol
    private var lastQuery: String?
    weak var delegate: FeedPopularMoviesServiceDelegate?

    init(api: FeedAPIProtocol = FeedAPI.make()) {
        self.api = api
    }
}

extension FeedService: FeedPopularMoviesServiceProtocol {
    func fetchMoviesRetry() {
        guard let query = lastQuery else { return }
        lastQuery = query

    }

    func fetchPopularMovies() {
        delegate?.didReceiveLoading()

        api.fetchPopularMovies { [weak self] result in
            switch result {
            case let .success(movies):
                self?.delegate?.didReceivePopular(movies: movies)
            case let .failure(error):
                self?.delegate?.didReceiveError(ofType: error)
            }
        }
    }

    func fetchTopRatedMovies() {
        delegate?.didReceiveLoading()

        api.fetchTopRatedMovies { [weak self] result in
            switch result {
            case let .success(movies):
                self?.delegate?.didTopRated(movies: movies)
            case let .failure(error):
                self?.delegate?.didReceiveError(ofType: error)
            }
        }
    }

    func fetchTrendingMovies() {
        delegate?.didReceiveLoading()

        api.fetchTrendingMovies { [weak self] result in
            switch result {
            case let .success(movies):
                self?.delegate?.didReceiveTrending(movies: movies)
            case let .failure(error):
                self?.delegate?.didReceiveError(ofType: error)
            }
        }
    }
}
