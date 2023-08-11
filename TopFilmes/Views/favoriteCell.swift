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
