//
//  ContentView.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 18/08/23.
//

import UIKit

final class MoviesView: UIView {

    private let segmentedControlView = SegmentedControlView()
    private let collectionView = MoviesCollectionView()
    private let scrollView = UIScrollView()

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
        addSubview(scrollView)
        scrollView.addSubview(collectionView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            segmentedControlView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            segmentedControlView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            segmentedControlView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),

            scrollView.topAnchor.constraint(equalTo: segmentedControlView.bottomAnchor, constant: 15),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),

            collectionView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            collectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

    private func setupAutoresizingMaskIntoConstraints() {
        segmentedControlView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .gray
    }

    func show(movies: [MovieModel]) {
        collectionView.setup(movies: movies)
    }
}
