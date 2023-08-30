//
//  FeedEndpoints.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 28/08/23.
//

import Foundation

enum FeedEndpoints {
    case popularMovies
    case topRatedMovies
    case trendingMovies
    case movieImages

    private var baseURL: String {
        switch self {
        case .popularMovies, .topRatedMovies, .trendingMovies:
            return "https://api.themoviedb.org"
        case .movieImages:
            return "https://image.tmdb.org"
        }
    }

    private var path: String {
        switch self {
        case .popularMovies:
            return "/3/movie/popular"
        case .topRatedMovies:
            return "/3/movie/top_rated"
        case .trendingMovies:
            return "/3/trending/movie/week"
        case .movieImages:
            return "/t/p/"
        }
    }

    var url: URL {
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.path = path

        guard let url = urlComponents?.url else {
            preconditionFailure("The url has not been built correctly")
        }
        return url
    }
}