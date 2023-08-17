//
//  HomeViewController.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 17/08/23.
//

import UIKit

final class HomeViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = .systemPink
    }

    override func loadView() {
        view = FooView()
    }

    private func setupNavigationBar() {
        title = "Cinewatch"
        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationItem.largeTitleDisplayMode = .always
    }
}

final class FooView: UIView {

    let saferAreaView = UIView()

    init() {
        super.init(frame: .zero)
        addSubview(saferAreaView)
        saferAreaView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saferAreaView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            saferAreaView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            saferAreaView.leadingAnchor.constraint(equalTo: leadingAnchor),
            saferAreaView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        saferAreaView.backgroundColor = .cyan
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
