//
//  FeedEndpoints.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 28/08/23.
//

import Foundation

enum FeedEndpoints {
    case trendingMovies

    private var baseURL: String {
        switch self {
        case .trendingMovies:
            return "https://api.themoviedb.org"
        }
    }

    private var path: String {
        switch self {
        case .trendingMovies:
            return "/3/movie/popular"
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
