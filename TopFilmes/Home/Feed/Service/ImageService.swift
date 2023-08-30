//
//  ImageService.swift
//  Top Filmes
//
//  Created by Erick Borges on 23/03/21.
//

import UIKit
import Foundation
//https://api.themoviedb.org/t/p/
class ImageService {
    let baseUrl = "https://image.tmdb.org/t/p/"

    func downloadImage(from path: String, size: String = "w500", completion: @escaping (UIImage?) -> Void) {
        let url = URL(string: "\(baseUrl + size + path)")!

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            print("terminou a requisição")

            guard error == nil else {
                print("houve um erro: \(error!)")
                completion(nil)
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

            let image = UIImage(data: data ?? Data())
            completion(image)
        }.resume()
    }
}
