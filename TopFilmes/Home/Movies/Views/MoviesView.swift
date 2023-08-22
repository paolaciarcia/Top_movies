//
//  ContentView.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 18/08/23.
//

import UIKit

final class MoviesView: UIView {

    let segmentedControlView = SegmentedControlView()
    let collectionView = MoviesCollectionView()
    let secondCollectionView = MoviesCollectionView()
    let thirdCollectionView = MoviesCollectionView()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .gray
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        setupAutoresizingMaskIntoConstraints()
    }
    
    private func setupViewHierarchy() {
        addSubview(segmentedControlView)
        addSubview(stackView)
        stackView.addArrangedSubview(collectionView)
        stackView.addArrangedSubview(secondCollectionView)
        stackView.addArrangedSubview(thirdCollectionView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            segmentedControlView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            segmentedControlView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            segmentedControlView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),

            stackView.topAnchor.constraint(equalTo: segmentedControlView.bottomAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func setupAutoresizingMaskIntoConstraints() {
        segmentedControlView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        secondCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }

    func show(movies: [MovieModel]) {
        collectionView.setup(movies: movies)
        secondCollectionView.setup(movies: movies)
        thirdCollectionView.setup(movies: movies)
    }
}
