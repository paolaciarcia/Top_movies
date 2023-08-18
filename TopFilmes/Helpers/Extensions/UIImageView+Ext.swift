//
//  UIImageView+Ext.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 18/08/23.
//

import UIKit

extension UIImageView {
    func downloadImage(url: String,
                       placeholderImage: UIImage? = nil) {
        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: url),
                  let data = try? Data(contentsOf: url),
                  let downloadedImage = UIImage(data: data) else {
                self?.setImage(data: placeholderImage)
                return
            }
            self?.setImage(data: downloadedImage)
        }
    }

    private func setImage(data: UIImage?) {
        DispatchQueue.main.async { [weak self] in
            self?.image = data
        }
    }
}
