//
//  CinewatchCoordinator.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 17/08/23.
//

import UIKit

final class Coordinator {
    var homeCoordinator: HomeCoordinator
    var searchCoordinator: SearchCoordinator
    var favoritesCoordinator: FavoritesCoordinator

    init(homeCoordinator: HomeCoordinator,
         searchCoordinator: SearchCoordinator,
         favoritesCoordinator: FavoritesCoordinator) {
        self.homeCoordinator = homeCoordinator
        self.searchCoordinator = searchCoordinator
        self.favoritesCoordinator = favoritesCoordinator
    }
}

final class HomeCoordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

final class SearchCoordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

final class FavoritesCoordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
