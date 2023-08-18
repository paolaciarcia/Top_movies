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
        view.backgroundColor = UIColor(hexString: "#202D3C")
    }

    override func loadView() {
        view = ContentView()
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
}
