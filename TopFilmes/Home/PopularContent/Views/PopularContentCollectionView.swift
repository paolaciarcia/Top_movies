//
//  PopularContentCollectionView.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 18/08/23.
//

import UIKit

final class PopularContentCollectionView: UIView {

    private var movies: [MovieModel] = []

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.register(PopularContentViewCell.self,
                                forCellWithReuseIdentifier: String(describing: PopularContentViewCell.self))

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
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
//        setupConstraints()
    }

    private func setupViewHierarchy() {
        addSubview(collectionView)
    }

//    private func setupConstraints() {
//        NSLayoutConstraint.activate([
//        ])
//    }
}

extension PopularContentCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PopularContentViewCell.self), for: indexPath) as? PopularContentViewCell else { return UICollectionViewCell() }
        cell.show(model: movies[indexPath.item])
        return cell
    }
}

extension PopularContentCollectionView: UICollectionViewDelegate {
    //Will be implemeted after complete layout
}
