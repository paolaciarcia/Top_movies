//
//  PopularContentViewCell.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 18/08/23.
//

import UIKit

final class CollectionViewTableViewCell: UITableViewCell {

    private var movies: [Movie] = []
    var section: Int = 0

    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal

        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: flowLayout)
        collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CollectionViewCell.self))
        collection.backgroundColor = UIColor(hexString: "#202D3C")
        collection.showsHorizontalScrollIndicator = false
        collection.contentInset = .init(top: 0.0,
                                        left: 12.0,
                                        bottom: 0.0,
                                        right: 12.0)

        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }

    private func setup() {
        setupViewHierarchy()
    }

    private func setupViewHierarchy() {
        contentView.addSubview(collectionView)
    }

    func setup(movies: [Movie]) {
        self.movies = movies
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

extension CollectionViewTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: CollectionViewCell.self), for: indexPath
        ) as? CollectionViewCell else {
            return UICollectionViewCell()
        }

        let posterPathImage = movies[indexPath.item].posterPath
        let backdropPathImage = movies[indexPath.item].backdropPath

        switch section {
        case Sections.trendingMovies.rawValue:
            cell.show(image: backdropPathImage)
            return cell
        case Sections.popularMovies.rawValue, Sections.topRatedMovies.rawValue:
            cell.show(image: posterPathImage)
            return cell
        default:
            return cell
        }
    }
}

extension CollectionViewTableViewCell: UICollectionViewDelegate {}

extension CollectionViewTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width =  UIScreen.main.bounds.width

        switch section {
        case Sections.trendingMovies.rawValue:
            return CGSize(width: width * 0.92, height: 230)
        case Sections.popularMovies.rawValue, Sections.topRatedMovies.rawValue:
            return CGSize(width: 132, height: 172)
        default:
            return CGSize(width: 132, height: 172)
        }
    }
}
