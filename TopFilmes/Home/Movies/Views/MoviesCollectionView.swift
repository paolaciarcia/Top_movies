//
//  MoviesCollectionView.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 18/08/23.
//

import UIKit

final class MoviesCollectionView: UIView {

    private var movies: [MovieModel] = []

    private lazy var collection: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(MoviesViewCell.self,
                                forCellWithReuseIdentifier: String(describing: MoviesViewCell.self))

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    init() {
        super.init(frame: .zero)
        collection.backgroundColor = .yellow
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collection.frame = bounds
    }

    private func setup() {
        setupViewHierarchy()
    }

    private func setupViewHierarchy() {
        addSubview(collection)
    }

    func setup(movies: [MovieModel]) {
        self.movies = movies
        DispatchQueue.main.async { [weak self] in
            self?.collection.reloadData()
        }
    }
}

extension MoviesCollectionView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MoviesViewCell.self),
                                                            for: indexPath) as? MoviesViewCell else { return UICollectionViewCell() }
        cell.show(image: movies[indexPath.row].image)
        return cell
    }
}

extension MoviesCollectionView: UICollectionViewDelegate {
//Will be implemeted soon
}

extension MoviesCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        return CGSize(width: width * 0.44, height: 250)
    }
}
