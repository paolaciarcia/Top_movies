//
//  DetailViewController.swift
//  Top Filmes
//
//  Created by Erick Borges on 08/03/21.
//

import UIKit
import TMDBSwift

class DetailViewController: UIViewController {

    let imageService = ImageService()
    let apiKey = "07ca879e7c8e68dd031be7a9dfd50689"
    var id: Int?
    var movies: MovieMDB?
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
            guard let movie = self.movies else { return }
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

    func showDetails(from id: Int) {
        TMDBConfig.apikey = "07ca879e7c8e68dd031be7a9dfd50689"
        MovieMDB.movie(movieID: id) {_, movie in
            if let movie = movie {
                DispatchQueue.main.async {
                    self.titleLabel.text = movie.title
                    self.setupImage(from: movie.backdrop_path ?? "")
                    self.duracaoLabel.text = "\(movie.runtime ?? 12) min"
                    self.overviewLabel.text = movie.overview
                    let lastGenre = movie.genres.last?.name
                    var genreText = ""

                    if !movie.genres.isEmpty {
                        for value in movie.genres {
                            if let value = value.name {
                                genreText += value
                            }

                            if value.name != lastGenre {
                                genreText += ", "
                            }
                        }
                    } else {
                        genreText = "No genres founded"
                    }

                    self.genreLabel.text = genreText
                    let formatter = DateFormatter()
                    let dateFromString = formatter.date(from: movie.release_date ?? "")
                    let calendar = Calendar.current.component(.year, from: dateFromString ?? Date())
                    self.anoLancamentoLabel.text = "\(calendar)"
                }
            }
        }
    }

    func setupImage(from path: String) {
        imageService.downloadImage(from: path) { downloadImage in
            DispatchQueue.main.async {
                self.backdropImageView.image = downloadImage
            }
        }
    }
}
