//
//  CollectionViewCell.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 24/08/23.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {

    private let cellImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
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
        contentView.addSubview(shadowView)
        shadowView.addSubview(cellImage)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: topAnchor),
            shadowView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: trailingAnchor),
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor),

            cellImage.topAnchor.constraint(equalTo: shadowView.topAnchor),
            cellImage.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
            cellImage.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor),
            cellImage.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor)
        ])
    }

    func show(image: UIImage?) {
        cellImage.image = image
    }
}
