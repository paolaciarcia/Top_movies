//
//  FeedErrorView.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 28/08/23.
//

import UIKit

final class FeedErrorView: UIView {

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 26
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let imageView: UIImageView = {
        let image = UIImageView(image: .init(named: "feedError"))
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = false
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let errorLabel: UILabel = {
        let label = UILabel()
        label.text = "Something wrong happened \nand we could not lot load the content"
        label.font = UIFont(name: "SF Pro Rounded", size: 18)
        label.textColor = UIColor(hexString: "#9A9FAB")
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var retryButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(hexString: "#334962")
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.25
        button.layer.borderColor = UIColor(hexString: "#979797")?.cgColor
        button.setTitle("Try again", for: .normal)
        button.setTitleColor(.systemOrange, for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        setup()
    }

    private func setup() {
        setupViewHierarchy()
        setupConstraints()
    }

    private func setupViewHierarchy() {
        addSubview(retryButton)
        addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(errorLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),

            retryButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            retryButton.widthAnchor.constraint(equalToConstant: 105),
            retryButton.heightAnchor.constraint(equalToConstant: 36),
            retryButton.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -120)
        ])

    }
}
