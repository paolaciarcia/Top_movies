//
//  HomeViewController.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 17/08/23.
//

import UIKit

protocol MoviesViewModelProtocol {
    var delegate: HomeViewControllerDelegate? { get set }
    func showPopularMoviesData()
}

enum Sections: Int {
    case trendingMovies
    case popularMovies
    case topRatedMovies
}

final class HomeViewController: UIViewController {

    private let contentView = FeedTableView()
    private var viewModel: MoviesViewModelProtocol

    init(viewModel: MoviesViewModelProtocol = MoviesViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = UIColor(hexString: "#202D3C")
        viewModel.delegate = self
        viewModel.showPopularMoviesData()
    }

    override func loadView() {
        view = contentView
    }

    private func setupNavigationBar() {
        navigationItem.title = "Cinewatch"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        setCustomNavigationBarTitleAttributes()
    }

    private func setCustomNavigationBarTitleAttributes() {
        let attrs = [
            NSAttributedString.Key.font: UIFont(name: "SignPainter", size: 48),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.largeTitleTextAttributes = attrs as [NSAttributedString.Key: Any]
    }
}

extension HomeViewController: HomeViewControllerDelegate {
    func showTopRatedMovies(data: [Movie]) {
        contentView.wantsToShowTopRatedMovies?(data)
    }

    func showTrendingMovies(data: [Movie]) {
        contentView.wantsToShowTrendingMovies?(data)
    }

    func showPopularMovies(data: [Movie]) {
        contentView.wantsToShowPopularMovies?(data)
    }

    func showError() {
        print("ERROR")
    }
}
