//
//  URLSession.swift
//  Top Filmes
//
//  Created by Erick Borges on 04/03/21.
//

import Foundation

// MARK: - Model

struct PopularMovies: Codable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Movie: Codable, Hashable {
    let backdropPath: String
    let posterPath: String

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
    }
}
