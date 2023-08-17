//
//  TabBarController.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 17/08/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupBarItem()
    }

    private func setupBarItem() {
        setupAppearence()

        let homeController = HomeViewController()
        let homeBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house")?.withTintColor(.systemOrange))
        homeController.tabBarItem = homeBarItem

        let searchController = SearchViewController()
        let searchBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass")?.withTintColor(.systemOrange))
        searchController.tabBarItem = searchBarItem

        let favoritesController = FavoritesViewController()
        let favoritesBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        favoritesController.tabBarItem = favoritesBarItem

        let controllers = [homeController, searchController, favoritesController]
        viewControllers = controllers
    }

    private func setupAppearence() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemOrange], for: .selected)
        UITabBar.appearance().tintColor = .systemOrange

    }
}

extension TabBarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Item \(item) selected")
    }
}
