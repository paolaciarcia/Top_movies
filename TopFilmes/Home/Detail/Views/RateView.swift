//
//  RateView.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 05/09/23.
//

import UIKit

struct RateViewState {
    let averageText: String
    let averageSize: CGFloat
    let circularProgressState: CircularProgressViewState
}

final class RateView: UIView {

    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "Rating"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var progressView: CircularProgressView = {
        let view = CircularProgressView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var averageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        addSubview(ratingLabel)
        addSubview(progressView)
        addSubview(averageLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: topAnchor),
            ratingLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            ratingLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            progressView.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 10),
            progressView.centerXAnchor.constraint(equalTo: ratingLabel.centerXAnchor),
            progressView.widthAnchor.constraint(equalTo: widthAnchor),
            progressView.heightAnchor.constraint(equalTo: widthAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor),

            averageLabel.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            averageLabel.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            averageLabel.trailingAnchor.constraint(equalTo: progressView.trailingAnchor, constant: -20),
            averageLabel.leadingAnchor.constraint(equalTo: progressView.leadingAnchor, constant: 20)
        ])
    }

    func update(state: RateViewState) {
        averageLabel.text = state.averageText
        averageLabel.font = .systemFont(ofSize: state.averageSize, weight: .medium)
        progressView.update(state: state.circularProgressState)
    }
}
