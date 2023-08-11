//
//  Request.swift
//  Top Filmes
//
//  Created by Erick Borges on 04/03/21.
//

import Foundation

// MARK: - Model

struct PopularMovies: Codable {
    let page: Int?
    let results: [Movie]?
    let totalPages: Int?
    let totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Movie: Codable {
    let posterPath: String?
    let adult: Bool?
    let overview: String?
    let genreIds: [Int]?
    let id: Int?
    let originalTitle: String?
    let originalLanguage: String?
    let title: String?
    let backdropPath: String?

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case adult
        case overview
        case genreIds = "genre_ids"
        case id
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case title
        case backdropPath = "backdrop_path"
    }
}

// MARK: - Montando a URL

// https://api.themoviedb.org/3/movie/popular?api_key=07ca879e7c8e68dd031be7a9dfd50689

let apiKey = "07ca879e7c8e68dd031be7a9dfd50689"

var urlComponents = URLComponents()
var scheme = urlComponents.scheme = "https"
urlComponents.host = "api.themoviedb.org"
urlComponents.path = "/3/movie/popular"
urlComponents.query = "api_key=\(apiKey)"

// MARK: - Montando a Requisição

print("URL: \(urlComponents.url!)")
var urlRequest = URLRequest(url: urlComponents.url!)
urlRequest.httpMethod = "GET"

// MARK: - Sessão: executa a Requisição

let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
    print("terminou a requisição")

    guard error == nil else {
        print("houve um erro: \(error!)")
        return
    }

    guard let httpResponse = response as? HTTPURLResponse else {
        print("não existe response")
        return
    }

    guard httpResponse.statusCode == 200 else {
        print("status code diferente de 200")
        return
    }

    guard let safeData = data else {
        print("o objeto data é nulo")
        return
    }

    do {
        let popularMovies = try JSONDecoder().decode(PopularMovies.self, from: safeData)
        print(popularMovies.page ?? 99)
        print(popularMovies.results?[1])
    } catch let error {
        print("Decode falhou com erro: \(error)")
    }
}.resume()
