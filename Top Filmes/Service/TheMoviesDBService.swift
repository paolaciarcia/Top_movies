//
//  TheMoviesDBService.swift
//  Top Filmes
//
//  Created by Erick Borges on 26/03/21.
//

import UIKit
import Foundation

class TheMoviesDBService {
    
    let apiKey = "07ca879e7c8e68dd031be7a9dfd50689"
    var urlComponents = URLComponents()
    
    func requestMovie(completion: @escaping (PopularMovies?) -> Void) {
        urlComponents.scheme = "https"
        urlComponents.host = "api.themoviedb.org"
        urlComponents.path = "/3/movie/popular"
        urlComponents.query = "api_key=\(apiKey)"
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"

        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
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
                completion(popularMovies)
                
            } catch let error {
                print("Decode falhou com erro: \(error)")
            }
        }.resume()
    }
    
    
    func requestDetails(from id: Int, completion: @escaping (MovieDetail?) -> Void) {
        urlComponents.scheme = "https"
        urlComponents.host = "api.themoviedb.org"
        urlComponents.path = "/3/movie/\(id)"
        urlComponents.query = "api_key=\(apiKey)"
        
        print("URL: \(urlComponents.url!)")
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
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
                print("status code diferente de 200 \(httpResponse.statusCode)")
                return
            }
            
            guard let safeData = data else {
                print("o objeto data é nulo")
                return
            }
            do {
                let detailMovies = try JSONDecoder().decode(MovieDetail.self, from: safeData)
                completion(detailMovies)
                
            } catch let error {
                print("Decode falhou com erro: \(error)")
            }
        }.resume()
    }
}


