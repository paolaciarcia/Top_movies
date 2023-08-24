//
//  ContentView.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 18/08/23.
//

import UIKit

final class MoviesView: UIView {

    private let segmentedControlView = SegmentedControlView()
    private let tableView = FeedTableView()

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
        addSubview(tableView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            segmentedControlView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            segmentedControlView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            segmentedControlView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),

            tableView.topAnchor.constraint(equalTo: segmentedControlView.bottomAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }

    private func setupAutoresizingMaskIntoConstraints() {
        segmentedControlView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }

    func show(movies: [MovieModel]) {
        tableView.setup(movies: movies)
    }
}
