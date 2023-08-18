//
//  PopularContentViewCell.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 18/08/23.
//

import UIKit

final class PopularContentViewCell: UICollectionViewCell {
    private let image: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 12
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()

    private let shadowView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        view.layer.shadowOffset = CGSize(width: 4, height: 6)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        setupViewHierarchy()
        setupConstraints()
    }

    private func setupViewHierarchy() {
        image.addSubview(shadowView)
        addSubview(image)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),

            shadowView.topAnchor.constraint(equalTo: image.topAnchor),
            shadowView.leadingAnchor.constraint(equalTo: image.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: image.trailingAnchor),
            shadowView.bottomAnchor.constraint(equalTo: image.bottomAnchor)
        ])
    }
}
