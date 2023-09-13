//
//  DetailViewController.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 05/09/23.
//

import UIKit

final class DetailViewController: UIViewController {

    private let contentView = RateView()

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

        let state = RateViewState(averageText: "7.8", averageSize: 50,
                                  circularProgressState: CircularProgressViewState(progress: 0.5, progressColor: .green))
        contentView.update(state: state)
    }

    override func loadView() {
        view = contentView
    }

}
