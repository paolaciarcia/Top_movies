//
//  DetailViewController.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 05/09/23.
//

import UIKit

final class DetailViewController: UIViewController {

    private let contentView = CircularProgressView(avarageText: "7.8", color: .green, progress: 0.7)

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#202D3C")
    }

    override func loadView() {
        view = contentView
    }

}
