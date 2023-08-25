//
//  HomeViewController.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 17/08/23.
//

import UIKit

final class HomeViewController: UIViewController {

    private let contentView = FeedTableView()
    private let viewModel: MoviesViewModel

    init(viewModel: MoviesViewModel = MoviesViewModel()) {
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
        show()
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

    private func show() {
        let items = [
            Items(image: .init(named: "posterImage")),
            Items(image: .init(named: "posterImage")),
            Items(image: .init(named: "posterImage")),
            Items(image: .init(named: "posterImage")),
            Items(image: .init(named: "posterImage")),
            Items(image: .init(named: "posterImage"))
        ]
        let movies = [
            MovieModel(section: nil, items: items),
            MovieModel(section: "Most popular", items: items),
            MovieModel(section: "Highest rated", items: items)
        ]
        contentView.setup(movies: movies)
    }
}

extension HomeViewController: MoviesViewModelDelegate {
    func showMovieImage(with string: String?) {}
}
