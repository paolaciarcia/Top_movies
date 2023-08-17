//
//  CollectionCell.swift
//  Top Filmes
//
//  Created by Erick Borges on 05/03/21.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    static let reuseIdentifier = String(describing: CollectionCell.self)
    let imageService = ImageService()

    func setupImage(from path: String) {
        imageService.downloadImage(from: path) { downloadImage in
            DispatchQueue.main.async {
                self.imageView.image = downloadImage
            }
        }
    }
}
