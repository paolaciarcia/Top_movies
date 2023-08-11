//
//  FavoritesMoviesTableViewController.swift
//  Top Filmes
//
//  Created by Erick Borges on 12/03/21.
//

import UIKit

class DataSource {
    static let shared = DataSource()
    private init() {}
    var favoriteMovies: [Movie] = []
}

class FavoritesMoviesTableViewController: UITableViewController {
    @IBOutlet var favoriteMoviesTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteMoviesTableView.delegate = self
        favoriteMoviesTableView.dataSource = self
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSource.shared.favoriteMovies.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(FavoriteCell.self)",
                                                       for: indexPath) as? FavoriteCell else {
            fatalError("Could not create RecipeCell")
        }
        cell.titleLabel.text = DataSource.shared.favoriteMovies[indexPath.row].title
        cell.setupImage(from: DataSource.shared.favoriteMovies[indexPath.row].posterPath ?? "")

        return cell
    }

    // MARK: - Table view Delegate
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        DataSource.shared.favoriteMovies.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
}
