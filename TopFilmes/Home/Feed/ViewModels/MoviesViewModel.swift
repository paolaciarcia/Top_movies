//
//  HomeViewModel.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 18/08/23.
//

import Foundation

protocol HomeViewControllerDelegate: AnyObject {
    func showPopularMovies(data: [Movie])
    func showTopRatedMovies(data: [Movie])
    func showTrendingMovies(data: [Movie])
    func showError()
    func showLoading()

}

final class MoviesViewModel: MoviesViewModelProtocol {

    private var service: FeedPopularMoviesServiceProtocol
    weak var delegate: HomeViewControllerDelegate?

    init(service: FeedPopularMoviesServiceProtocol = FeedService()) {
        self.service = service
        self.service.delegate = self
    }

    func showMoviesData() {
        service.fetchPopularMovies()
        service.fetchTrendingMovies()
        service.fetchTopRatedMovies()
    }
}

extension MoviesViewModel: FeedPopularMoviesServiceDelegate {
    func didTopRated(movies: PopularMovies) {
        delegate?.showTopRatedMovies(data: movies.results)
    }

    func didReceiveTrending(movies: PopularMovies) {
        delegate?.showTrendingMovies(data: movies.results)
    }

    func didReceivePopular(movies: PopularMovies) {
        delegate?.showPopularMovies(data: movies.results)
    }

    func didReceiveError(ofType: ClientError) {
        delegate?.showError()
    }

    func didReceiveEmptyResult() {
        delegate?.showError()
    }

    func didReceiveLoading() {
        delegate?.showLoading()
    }
}
