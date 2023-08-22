//
//  HomeViewController.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 17/08/23.
//

import UIKit
import TMDBSwift

final class HomeViewController: UIViewController {

    private let contentView = MoviesView()
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
        TMDBConfig.apikey = "07ca879e7c8e68dd031be7a9dfd50689"
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
            NSAttributedString.Key.font: UIFont(name: "SignPainter", size: 48)
        ]
        navigationController?.navigationBar.largeTitleTextAttributes = attrs as [NSAttributedString.Key: Any]
    }

    private func show() {
        let movies = [
            MovieModel(image: .init(named: "posterImage")),
            MovieModel(image: .init(named: "posterImage")),
            MovieModel(image: .init(named: "posterImage")),
            MovieModel(image: .init(named: "posterImage")),
            MovieModel(image: .init(named: "posterImage")),
            MovieModel(image: .init(named: "posterImage"))
        ]
        contentView.show(movies: movies)
    }
}

extension HomeViewController: MoviesViewModelDelegate {
    func showMovieImage(with string: String?) {}
}
