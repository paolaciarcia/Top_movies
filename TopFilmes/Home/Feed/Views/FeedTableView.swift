//
//  MoviesCollectionView.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 18/08/23.
//

import UIKit

final class FeedTableView: UIView {

    private var movies: [MovieModel] = []
    private var bottomNavigationBarConstraint = NSLayoutConstraint()
    private let segmentedControlView = SegmentedControlView()

    private lazy var homeFeedTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.contentInset = .init(top: -30, left: 0, bottom: 0, right: 0)
        tableView.backgroundColor = UIColor(hexString: "#202D3C")
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: String(describing: CollectionViewTableViewCell.self))
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
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
        segmentedControlView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupViewHierarchy() {
        addSubview(segmentedControlView)
        addSubview(homeFeedTableView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            segmentedControlView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            segmentedControlView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            segmentedControlView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            homeFeedTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            homeFeedTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            homeFeedTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])

        bottomNavigationBarConstraint = homeFeedTableView.topAnchor.constraint(equalTo: segmentedControlView.bottomAnchor, constant: 15)
        bottomNavigationBarConstraint.isActive = true
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
        return movies.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CollectionViewTableViewCell.self),
                                                       for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell() }
        let section = indexPath.section
        cell.section = section
        cell.setup(items: movies[indexPath.row].items)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section

        if section == 0 {
            return 250
        } else {
            return 182
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 5
        } else {
            return 50
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return movies[section].section
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 36 {
            self.segmentedControlView.isHidden = true
            self.bottomNavigationBarConstraint.constant = -30
            UIView.animate(withDuration: 0.5) {
                self.layoutIfNeeded()
            }
        } else {
            self.segmentedControlView.isHidden = false
            self.bottomNavigationBarConstraint.constant = 15
            UIView.animate(withDuration: 0.3) {
                self.layoutIfNeeded()
            }
        }
    }
}
