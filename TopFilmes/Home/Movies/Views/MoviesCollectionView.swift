//
//  MoviesCollectionView.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 18/08/23.
//

import UIKit

final class MoviesCollectionView: UIView {

    private var movies: [MovieModel] = []

    private lazy var popularMoviesCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor(hexString: "#202D3C")
        collectionView.register(MoviesViewCell.self,
                                forCellWithReuseIdentifier: String(describing: MoviesViewCell.self))

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private lazy var ratedMoviesCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor(hexString: "#202D3C")
        collectionView.register(MoviesViewCell.self,
                                forCellWithReuseIdentifier: String(describing: MoviesViewCell.self))

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
        setupConstraints()
    }

    private func setupViewHierarchy() {
        addSubview(popularMoviesCollectionView)
        addSubview(ratedMoviesCollectionView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            popularMoviesCollectionView.topAnchor.constraint(equalTo: topAnchor),
            popularMoviesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            popularMoviesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            popularMoviesCollectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            popularMoviesCollectionView.heightAnchor.constraint(equalTo: widthAnchor),
            ratedMoviesCollectionView.topAnchor.constraint(equalTo: popularMoviesCollectionView.bottomAnchor, constant: 20),
            ratedMoviesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            ratedMoviesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ratedMoviesCollectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            ratedMoviesCollectionView.heightAnchor.constraint(equalTo: widthAnchor)
        ])
    }

    func setup(movies: [MovieModel]) {
        self.movies = movies
        DispatchQueue.main.async { [weak self] in
            self?.popularMoviesCollectionView.reloadData()
            self?.ratedMoviesCollectionView.reloadData()
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
        return 12
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width * 0.31, height: frame.height * 0.27)
    }
}
//erros log
//scrollView
