//
//  VoteAverageView.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 05/09/23.
//

import UIKit

final class VoteAverageView: UIView {

    private var averageColor: UIColor
    private var averageSize: CGFloat
    private var progress: CGFloat

    private lazy var progressView: CircularProgressView = {
        let view = CircularProgressView(color: averageColor, progress: progress)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var averageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SF Pro Rounded", size: averageSize)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init(avarageText: String,
         avarageSize: CGFloat = 24,
         averageColor: UIColor,
         progress: CGFloat) {
        self.averageColor = averageColor
        self.averageSize = avarageSize
        self.progress = progress
        super.init(frame: .zero)
        averageLabel.text = avarageText
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
        addSubview(progressView)
        addSubview(averageLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor),

            averageLabel.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            averageLabel.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            averageLabel.leadingAnchor.constraint(equalTo: progressView.leadingAnchor, constant: 20),
            averageLabel.trailingAnchor.constraint(equalTo: progressView.trailingAnchor, constant: -20)
        ])
    }
}
