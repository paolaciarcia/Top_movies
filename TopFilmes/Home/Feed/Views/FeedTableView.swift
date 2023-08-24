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
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = UIColor(hexString: "#202D3C")
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: String(describing: CollectionViewTableViewCell.self))
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

    override func layoutSubviews() {
        super.layoutSubviews()
        homeFeedTableView.frame = bounds
    }

    private func setup() {
        setupViewHierarchy()
//        foo()
    }

    private func foo() {
        NSLayoutConstraint.activate([
            homeFeedTableView.topAnchor.constraint(equalTo: topAnchor),
            homeFeedTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            homeFeedTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            homeFeedTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setupViewHierarchy() {
        addSubview(homeFeedTableView)
    }

    func setup(movies: [MovieModel]) {
        self.movies = movies
        DispatchQueue.main.async { [weak self] in
            self?.homeFeedTableView.reloadData()
        }
    }
}

extension FeedTableView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CollectionViewTableViewCell.self),
                                                       for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell() }
        cell.setup(movies: movies)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 182
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
