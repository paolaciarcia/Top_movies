//
//  HomeViewModel.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 18/08/23.
//

import Foundation
import TMDBSwift

protocol MoviesListProtocol {

}

protocol MoviesViewModelDelegate: AnyObject {
    func showMovieImage(with string: String?)

}

final class MoviesViewModel {

    private let service: MoviesListProtocol
    weak var delegate: MoviesViewModelDelegate?

    init(service: MoviesListProtocol = MoviesListService()) {
        self.service = service
//        self.delegate = delegate
    }

    func fetchMovies() {
        MovieMDB.popular(page: 1) { data, requestMovie in
            guard let requestMovie = requestMovie else { return }
            self.delegate?.showMovieImage(with: requestMovie[0].backdrop_path)
        }
    }
}
/*
 MovieMDB.popular(apikey, language: "en", page: 1){
 data, popularMovies in
 if let movie = popularMovies{
 print(movie[0].title)
 print(movie[0].original_title)
 print(movie[0].release_date)
 print(movie[0].overview)
 }
 */
final class MoviesListService: MoviesListProtocol {

}
