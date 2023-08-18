//
//  HomeViewModel.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 18/08/23.
//

import Foundation

protocol MoviesListProtocol {

}

protocol MoviesViewModelDelegate: AnyObject {

}

final class MoviesViewModel {

    private let service: MoviesListProtocol
    weak var delegate: MoviesViewModelDelegate?

    init(service: MoviesListProtocol = MoviesListService()) {
        self.service = service
//        self.delegate = delegate
    }

    func fetchMovies() {

    }
}

final class MoviesListService: MoviesListProtocol {

}
