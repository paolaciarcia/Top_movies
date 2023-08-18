//
//  ContentView.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 18/08/23.
//

import UIKit

final class ContentView: UIView {

    let segmentedControlView = SegmentedControlView()
    let collectionView = PopularContentCollectionView()

    init() {
        super.init(frame: .zero)
        segmentedControlView.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(segmentedControlView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            segmentedControlView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            segmentedControlView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            segmentedControlView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12)
        ])
    }
}
