//
//  UIImageView+Ext.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 18/08/23.
//

import UIKit

enum ImageSizes: String {
    case w45
    case w92
    case w154
    case w185
    case w300
    case w500
    case original
}

extension UIImageView {
    func downloadImage(baseURL: URL,
                       size: ImageSizes,
                       path: String?,
                       placeholderImage: UIImage? = nil) {
        showLoading()

        DispatchQueue.global().async { [weak self] in
            guard let path = path,
                  let urlString = URL(string: "\(baseURL)\(size)\(path)"),
                  let data = try? Data(contentsOf: urlString),
                  let downloadedImage = UIImage(data: data) else {
                self?.setImage(data: placeholderImage)
                return
            }
            self?.setImage(data: downloadedImage)
        }
    }

    private func setImage(data: UIImage?) {
        DispatchQueue.main.async { [weak self] in
            self?.hideLoading()
            self?.image = data
        }
    }

    private func showLoading() {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        addSubview(activityIndicator)

        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    private func hideLoading() {
        let activityIndicator = subviews.first { view in
            view.isKind(of: UIActivityIndicatorView.self)
        }
        activityIndicator?.removeFromSuperview()
    }
}
