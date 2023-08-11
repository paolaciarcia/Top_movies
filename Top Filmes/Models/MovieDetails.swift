//
//  MovieDetails.swift
//  Top Filmes
//
//  Created by Erick Borges on 09/03/21.
//

import Foundation

struct MovieDetail: Codable, Hashable {
    
    let adult: Bool?
    let backdropPath: String?
    let title: String?
    let releaseDate: String?
    let runtime: Int?
    let genres: [Genre]?
    let overview: String?
    let id: Int?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case title
        case releaseDate = "release_date"
        case runtime
        case genres
        case overview
        case id
    } 
}

struct Genre: Codable, Hashable {
    
    let id: Int?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}


