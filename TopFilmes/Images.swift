//
//  Images.swift
//  Top Filmes
//
//  Created by Erick Borges on 05/03/21.
//

import Foundation

struct Images: Codable {
    let id: Int?
    let backdrops: [BackdropConfiguration]?
    let posters: [PosterConfiguration]?
}

struct BackdropConfiguration: Codable {
    let aspectRatio: Int?
    let backdropPath: String?
    let height: Int?
    let width: Int?
    let iso6391: String?

    enum CodingKeys: String, CodingKey {
        case aspectRatio = "aspect_ratio"
        case backdropPath = "file_path"
        case height = "height"
        case width = "width"
        case iso6391 = "iso_639_1"
    }
}

struct PosterConfiguration: Codable {
    let aspectRatio: Int?
    let posterPath: String?
    let height: Int?
    let width: Int?
    let iso6391: String?

    enum CodingKeys: String, CodingKey {
        case aspectRatio = "aspect_ratio"
        case posterPath = "file_path"
        case height = "height"
        case width = "width"
        case iso6391 = "iso_639_1"
    }
}
