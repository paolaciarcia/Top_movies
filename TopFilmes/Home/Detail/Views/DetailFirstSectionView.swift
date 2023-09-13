//
//  VoteAverageView.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 06/09/23.
//

import UIKit

struct DetailFirstSectionState {
    let title: String
    let genre: String
    let releaseDate: String
    let duration: String
    let rating: RateViewState
}

final class DetailFirstSectionView: UIView {

    private let verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 7
        stack.alignment = .top
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let actionsHorizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let mainHorizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .top
        stack.spacing = 40
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let spacingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 26, weight: .medium)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let genreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(hexString: "#C7C7CC")
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let releaseAndDurationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let durationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var rateView: RateView = {
        let view = RateView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var buttonConfiguration: UIButton.Configuration {
        var configuration = UIButton.Configuration.filled()
        configuration.imagePadding = 5
        configuration.title = "Trailer"
        configuration.baseForegroundColor = .systemOrange
        configuration.titleAlignment = .center
        configuration.image = UIImage(systemName: "play.fill")
        return configuration
    }

    private lazy var trailerButton: UIButton = {
        let button = UIButton(configuration: buttonConfiguration)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.60
        button.layer.borderColor = UIColor(hexString: "#979797")?.cgColor
        button.tintColor = UIColor(hexString: "#334962")
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hexString: "#1C1C1E")
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 0.50
        button.layer.borderColor = UIColor(hexString: "#3E5773")?.cgColor
        button.setImage(UIImage(systemName: "heart"), for: .normal)//set dynamic image
        button.tintColor = .systemRed
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.2
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init() {
        super.init(frame: .zero)
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
        addSubview(mainHorizontalStackView)
        mainHorizontalStackView.addArrangedSubview(verticalStackView)
        mainHorizontalStackView.addArrangedSubview(rateView)

        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(genreLabel)
        verticalStackView.addArrangedSubview(releaseAndDurationLabel)
        verticalStackView.addArrangedSubview(spacingView)
        verticalStackView.addArrangedSubview(actionsHorizontalStackView)
        actionsHorizontalStackView.addArrangedSubview(trailerButton)
        actionsHorizontalStackView.addArrangedSubview(favoriteButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainHorizontalStackView.topAnchor.constraint(equalTo: topAnchor),
            mainHorizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainHorizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            spacingView.heightAnchor.constraint(equalToConstant: 20),
            actionsHorizontalStackView.heightAnchor.constraint(equalToConstant: 40),
            actionsHorizontalStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.45),
            favoriteButton.widthAnchor.constraint(equalTo: actionsHorizontalStackView.heightAnchor)
        ])

    }

    func update(state: DetailFirstSectionState) {
        titleLabel.text = state.title
        genreLabel.text = state.genre
        releaseAndDurationLabel.text = "\(state.releaseDate) \(state.duration)"
        durationLabel.text = state.duration
        rateView.update(state: state.rating)
    }
}
