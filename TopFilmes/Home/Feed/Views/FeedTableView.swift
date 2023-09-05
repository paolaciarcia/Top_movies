//
//  MoviesCollectionView.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 18/08/23.
//

import UIKit

enum MoviesFeedState {
    case ready
    case loading
    case error
}

final class FeedTableView: UIView {

    var wantsToShowTrendingMovies: (([Movie]) -> Void)?
    var wantsToShowPopularMovies: (([Movie]) -> Void)?
    var wantsToShowTopRatedMovies: (([Movie]) -> Void)?

    private let sectionTitles = [
        nil,
        "Most Popular",
        "Highest rated"
    ]

    private var movies: [Movie] = []
    private var bottomNavigationBarConstraint = NSLayoutConstraint()

    private let segmentedControlView: SegmentedControlView = {
        let view = SegmentedControlView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let errorView: FeedErrorView = {
        let view = FeedErrorView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let loadingView: FeedLoadingView = {
        let view = FeedLoadingView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var homeFeedTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = UIColor(hexString: "#202D3C")
        tableView.register(CollectionViewTableViewCell.self,
                           forCellReuseIdentifier: String(describing: CollectionViewTableViewCell.self))
        tableView.register(FeedHeaderForSectionView.self,
                           forHeaderFooterViewReuseIdentifier: String(describing: FeedHeaderForSectionView.self))
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isHidden = true
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    // MARK: - Init
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
        addSubview(segmentedControlView)
        addSubview(homeFeedTableView)
        addSubview(loadingView)
        addSubview(errorView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            segmentedControlView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            segmentedControlView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            segmentedControlView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            homeFeedTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            homeFeedTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            homeFeedTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            errorView.topAnchor.constraint(equalTo: topAnchor),
            errorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            errorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            errorView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            loadingView.topAnchor.constraint(equalTo: topAnchor),
            loadingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            loadingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])

        bottomNavigationBarConstraint = homeFeedTableView.topAnchor.constraint(equalTo: segmentedControlView.bottomAnchor, constant: 15)
        bottomNavigationBarConstraint.isActive = true
    }

    // MARK: - Methods
    func showMovies(state: MoviesFeedState) {
        switch state {
        case .ready:
            segmentedControlView.isHidden = false
            homeFeedTableView.isHidden = false
            errorView.isHidden = true
            loadingView.isHidden = true
        case .loading:
            loadingView.isHidden = false
            segmentedControlView.isHidden = true
            homeFeedTableView.isHidden = true
            errorView.isHidden = true
        case .error:
            segmentedControlView.isHidden = true
            homeFeedTableView.isHidden = true
            errorView.isHidden = false
            loadingView.isHidden = true
        }
    }
}

// MARK: - UITableViewDataSource
extension FeedTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CollectionViewTableViewCell.self),
                                                       for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell() }
        switch indexPath.section {
        case Sections.trendingMovies.rawValue:
            cell.section = 0
            wantsToShowTrendingMovies = { movies in
                cell.setup(movies: movies)
            }
        case Sections.popularMovies.rawValue:
            cell.section = 1
            wantsToShowPopularMovies = { movies in
                cell.setup(movies: movies)
            }
        case Sections.topRatedMovies.rawValue:
            cell.section = 2
            wantsToShowTopRatedMovies = { movies in
                cell.setup(movies: movies)
            }

        default:
            return UITableViewCell()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        switch indexPath.section {
        case Sections.trendingMovies.rawValue:
            return 250
        case Sections.popularMovies.rawValue, Sections.topRatedMovies.rawValue:
            return 195
        default:
            return 195
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        switch section {
        case Sections.trendingMovies.rawValue:
            return 0
        case Sections.popularMovies.rawValue, Sections.topRatedMovies.rawValue:
            return 30
        default:
            return 30
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: String(describing: FeedHeaderForSectionView.self)
        ) as? FeedHeaderForSectionView else { return UIView() }
        headerView.show(titleForSection: sectionTitles[section])
        return headerView
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


extension FeedTableView: UITableViewDelegate {}
