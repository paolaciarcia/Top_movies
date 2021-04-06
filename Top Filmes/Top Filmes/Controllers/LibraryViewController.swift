//
//  ViewController.swift
//  Top Filmes
//
//  Created by Erick Borges on 04/03/21.
//

import UIKit

class LibraryViewController: UIViewController {

    static func update(movie: Movie) {
    }
    
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

    // MARK: - Montando a URL
    
    //https://api.themoviedb.org/3/movie/popular?api_key=07ca879e7c8e68dd031be7a9dfd50689
    
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

//        let apiKey = "07ca879e7c8e68dd031be7a9dfd50689"
//        var urlComponents = URLComponents()
//        urlComponents.scheme = "https"
//        urlComponents.host = "api.themoviedb.org"
//        urlComponents.path = "/3/movie/popular"
//        urlComponents.query = "api_key=\(apiKey)"
//
//        // MARK: - Montando a Requisição
//
//        print("URL: \(urlComponents.url!)")
//        var urlRequest = URLRequest(url: urlComponents.url!)
//        urlRequest.httpMethod = "GET"
//
//        // MARK: - Sessão: executa a Requisição
//
//        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//            print("terminou a requisição")
//
//            guard error == nil else {
//                print("houve um erro: \(error!)")
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse else {
//                print("não existe response")
//                return
//            }
//
//            guard httpResponse.statusCode == 200 else {
//                print("status code diferente de 200")
//                return
//            }
//
//            guard let safeData = data else {
//                print("o objeto data é nulo")
//                return
//            }
//            // do & catch trabalham em conjunto com o "try" para tentar decodificar o JSON, transformando ele em uma struct(PopularMovies). No caso da imagem, ela não é decodicada, já que nao é um JSON que esta sendo recebido.
//            do {
//                let popularMovies = try JSONDecoder().decode(PopularMovies.self, from: safeData)
//                self.movies = popularMovies.results ?? []
//
//                DispatchQueue.main.async {
//                    self.collectionView.reloadData()
//                }
//            } catch let error {
//                print("Decode falhou com erro: \(error)")
//            }
//        }.resume()
//    }


extension LibraryViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CollectionCell else {
            fatalError("não foi possível instanciar a célula com identifier: CollectionCell")
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
        guard let movieDetailController = storyboard.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else {
            return
        }
        movieDetailController.id = selectedMovie.id
        movieDetailController.movie = selectedMovie
        present(movieDetailController, animated: true, completion: nil)
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        let widthSize = (screenSize.width - 28.0) / 3
        let heightSize = widthSize * 1.50
        return CGSize(width: widthSize, height: heightSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 7.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 7.0, left: 7.0, bottom: 7.0, right: 7.0)
    }
}

