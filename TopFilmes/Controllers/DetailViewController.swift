//
//  DetailViewController.swift
//  Top Filmes
//
//  Created by Erick Borges on 08/03/21.
//

import UIKit

class DetailViewController: UIViewController {

    let imageService = ImageService()

    var id: Int?
    var movie: Movie?
    var movieDetail: MovieDetail?
    var theMovieDBService = TheMoviesDBService()

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var anoLancamentoLabel: UILabel!
    @IBOutlet weak var duracaoLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBAction func closeButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func favoriteButton(_ sender: UIButton) {
        if sender.tintColor == UIColor.systemGray5 {
            sender.tintColor = UIColor.yellow
        } else if sender.tintColor == UIColor.yellow {
            sender.tintColor = UIColor.systemGray5
        }
            guard let movie = self.movie else { return }
            DataSource.shared.favoriteMovies.append(movie)
    }

    func setupButton(from sender: UIButton) {
        sender.layer.shadowColor = UIColor.black.cgColor
        sender.layer.shadowOffset = CGSize(width: 1, height: 5)
        sender.layer.shadowRadius = 3
        sender.layer.shadowOpacity = 0.3
    }

    @IBOutlet weak var backdropImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton(from: closeButton)
        setupButton(from: favoriteButton)
        showDetails(from: self.id ?? -1)
        favoriteButton.tintColor = UIColor.systemGray5
    }
    // receber um id
    func showDetails(from id: Int) {
        theMovieDBService.requestDetails(from: id) { (requestDetail) in
            guard let requestDetail = requestDetail else { return }
            DispatchQueue.main.async {
                self.movieDetail = requestDetail
                self.titleLabel.text = requestDetail.title
                self.setupImage(from: requestDetail.backdropPath ?? "")
                self.duracaoLabel.text = "\(requestDetail.runtime!) min"
                self.overviewLabel.text = requestDetail.overview
                guard let genre = self.movieDetail?.genres else { return }
                var genres = ""
                for value in genre {
                    genres += value.name ?? ""
                    if value.name != genre.last?.name {
                        genres += ", "
                    }
                }
                self.genreLabel.text = genres
                let formatter = DateFormatter()
                let dateFromString = formatter.date(from: requestDetail.releaseDate ?? "")
                let calendar = Calendar.current.component(.year, from: dateFromString ?? Date())
                self.anoLancamentoLabel.text = "\(calendar)"
            }
        }
    }

    func setupImage(from path: String) {
        imageService.downloadImage(from: path) { (downloadImage) in
            DispatchQueue.main.async {
                self.backdropImageView.image = downloadImage
            }
        }
    }
}
