//
//  ViewController.swift
//  Top Filmes
//
//  Created by Erick Borges on 04/03/21.
//

import UIKit

class LibraryViewController: UIViewController {
    var movies: [Movie] = []
    var theMovieDBService = TheMoviesDBService()

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        fetchMovies()
    }

    func fetchMovies() {
        theMovieDBService.requestMovie { (requestMovie) in
            guard let requestMovie = requestMovie else { return }
            self.movies = requestMovie.results ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension LibraryViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell",
                                                            for: indexPath) as? CollectionCell else {
            fatalError("Não foi possível instanciar a célula com identifier: CollectionCell")
        }
        cell.setupImage(from: movies[indexPath.item].posterPath ?? "")
        cell.layer.cornerRadius = 10
        return cell
    }
}

extension LibraryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let selectedMovie = movies[indexPath.item]
        guard let movieDetailController = storyboard.instantiateViewController(identifier: "DetailViewController") as?
                DetailViewController else { return }
        movieDetailController.id = selectedMovie.id
        movieDetailController.movie = selectedMovie
        present(movieDetailController, animated: true, completion: nil)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        let widthSize = (screenSize.width - 28.0) / 3
        let heightSize = widthSize * 1.50
        return CGSize(width: widthSize, height: heightSize)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 7.0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7.0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 7.0, left: 7.0, bottom: 7.0, right: 7.0)
    }
}
