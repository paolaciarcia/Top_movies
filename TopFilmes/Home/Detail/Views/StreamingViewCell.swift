//
//  StreamingViewCell.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 13/09/23.
//

import UIKit

final class StreamingViewCell: UICollectionViewCell {

    private let cellImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        cellImage.frame = contentView.bounds
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        cellImage.image = nil
    }

    func show(image: String?,
              id: Int) {
        cellImage.image = nil
        cellImage.downloadImage(baseURL: FeedEndpoints.streamings(id: id).url,
                                size: .original,
                                path: image)
    }
}
