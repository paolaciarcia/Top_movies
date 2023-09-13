//
//  DetailViewController.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 05/09/23.
//

import UIKit

final class DetailViewController: UIViewController {

    private let contentView = DetailFirstSectionView()

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

        let rateViewState = RateViewState(averageText: "7.8", averageSize: 25,
                                          circularProgressState: CircularProgressViewState(progress: 0.5, progressColor: .green))
        let detailState = DetailFirstSectionState(title: "The Little Marmeid",
                                                  genre: "Animação, Ação, Aventura, Ficção científica",
                                                  releaseDate: "20/07/2023 •",
                                                  duration: "2h 20m",
                                                  rating: rateViewState)
        contentView.update(state: detailState)
    }

    override func loadView() {
        view = contentView
    }

}
