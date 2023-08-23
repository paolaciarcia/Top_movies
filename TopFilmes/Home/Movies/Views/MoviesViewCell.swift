//
//  PopularContentViewCell.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 18/08/23.
//

import UIKit

final class MoviesViewCell: UICollectionViewCell {
    private let cellImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 12
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()

    private let shadowView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = .black
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowOpacity = 0.5
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
        addSubview(shadowView)
        addSubview(cellImage)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cellImage.topAnchor.constraint(equalTo: topAnchor),
            cellImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellImage.bottomAnchor.constraint(equalTo: bottomAnchor),

            shadowView.topAnchor.constraint(equalTo: cellImage.topAnchor),
            shadowView.leadingAnchor.constraint(equalTo: cellImage.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: cellImage.trailingAnchor),
            shadowView.bottomAnchor.constraint(equalTo: cellImage.bottomAnchor)
        ])
    }

    func show(image: UIImage?) {
        cellImage.image = image
    }
}
