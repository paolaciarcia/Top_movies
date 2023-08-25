//
//  FeedHeaderForSectionView.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 25/08/23.
//

import UIKit

final class FeedHeaderForSectionView: UITableViewHeaderFooterView {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SF Pro Rounded", size: 48)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = bounds
    }

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been initialized")
    }

    private func setup() {
        setupViewHierarchy()
        setupConstraints()
    }

    private func setupViewHierarchy() {
        contentView.addSubview(titleLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func show(titleForSection: String?) {
        titleLabel.text = titleForSection
    }
}
