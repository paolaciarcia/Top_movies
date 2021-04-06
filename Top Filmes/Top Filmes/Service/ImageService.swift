//
//  ImageService.swift
//  Top Filmes
//
//  Created by Erick Borges on 23/03/21.
//

import UIKit
import Foundation

class ImageService {
    
    // É um valor fixo. Colocando fora da função, evito que fique se repetindo em todas funcoes
    let baseUrl = "https://image.tmdb.org/t/p/"
    
    // o size foi colocado como parametro para tornar o codigo mais flexivel, tendo ao mesmo tempo um valor default
    // completion: permite que a imagem seja retornada de forma assincrona
    func downloadImage(from path: String, size: String = "w500", completion: @escaping (UIImage?) -> Void) {
        
        let url = URL(string: "\(baseUrl + size + path)")!
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
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
            
            // é feita uma tranformacao do tipo Data para o tipo UIImage
            let image = UIImage(data: data ?? Data())
            completion(image)
        }.resume()
    }
}
