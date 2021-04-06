//
//  FavoriteCell.swift
//  Top Filmes
//
//  Created by Erick Borges on 12/03/21.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var favoriteMovieImage: UIImageView!
    
    let imageService = ImageService()
    
    func setupImage(from path: String) {
        
        imageService.downloadImage(from: path) { (downloadImage) in
            DispatchQueue.main.async {
                self.favoriteMovieImage.image = downloadImage
                self.favoriteMovieImage.layer.cornerRadius = 5
            }
        }
    }
}
        
//        let baseUrl = "https://image.tmdb.org/t/p/"
//        let size = "w500"
//        let url = URL(string: "\(baseUrl + size + path)")!
//
//        print("URL: \(url)")
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "GET"
//
//        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//            print("terminou a requisição")
//
//            guard error == nil else {
//                print("houve um erro: \(error!)")
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse else {
//                print("não existe response")
//                return
//            }
//
//            guard httpResponse.statusCode == 200 else {
//                print("status code diferente de 200 \(httpResponse.statusCode)")
//                return
//            }
//
//            do {
//                let image = UIImage(data: data ?? Data())
//                DispatchQueue.main.async {
//                    self.favoriteMovieImage.image = image
//                    self.favoriteMovieImage.layer.cornerRadius = 5
//                }
//            }
//        }.resume()
    

