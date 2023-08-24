//
//  MoviesCollectionView.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 18/08/23.
//

import UIKit

final class FeedTableView: UIView {

    private var movies: [MovieModel] = []

    private lazy var homeFeedTableView: UITableView = {
//        let tableView = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .horizontal
        let tableView = UITableView()
//        UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        tableView.backgroundColor = UIColor(hexString: "#202D3C")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: CollectionViewTableViewCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        addSubview(homeFeedTableView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            homeFeedTableView.topAnchor.constraint(equalTo: topAnchor),
            homeFeedTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            homeFeedTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            homeFeedTableView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            homeFeedTableView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }

    func setup(movies: [MovieModel]) {
        self.movies = movies
        DispatchQueue.main.async { [weak self] in
            self?.homeFeedTableView.reloadData()
        }
    }
}

extension FeedTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CollectionViewTableViewCell.self),
                                                       for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell() }
        cell.show(image: movies[indexPath.row].image)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

extension FeedTableView: UITableViewDelegate {
    //Will be implemeted soon
}

extension FeedTableView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width * 0.31, height: frame.height * 0.27)
    }
}
