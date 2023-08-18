//
//  TabBarController.swift
//  TopFilmes
//
//  Created by Paola Golombieski Ciarcia on 17/08/23.
//

import UIKit

class TabBarController: UITabBarController {

    var customTabBarView = UIView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarItem()
        setupTabBarAppearence()
        addCustomTabBarView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupCustomTabBarFrame()
    }

    private func setupBarItem() {
        let homeController = HomeViewController()
        let homeBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        homeController.tabBarItem = homeBarItem

        let searchController = SearchViewController()
        let searchBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglas"))
        searchController.tabBarItem = searchBarItem

        let favoritesController = FavoritesViewController()
        let favoritesBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        favoritesController.tabBarItem = favoritesBarItem

        let controllers = [
            homeController,
            searchController,
            favoritesController
        ]
        viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }
    }

    private func setupTabBarAppearence() {
        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemOrange], for: .selected)
        tabBar.tintColor = .systemOrange
        tabBar.unselectedItemTintColor = .white
        tabBar.backgroundColor = UIColor(hexString: "#344962", alpha: 1)
        tabBar.layer.cornerRadius = 8
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    private func addCustomTabBarView() {
        customTabBarView.frame = tabBar.frame
        customTabBarView.backgroundColor = .black
        customTabBarView.layer.cornerRadius = 8.0
        customTabBarView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        customTabBarView.layer.masksToBounds = false
        customTabBarView.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        customTabBarView.layer.shadowOffset = CGSize(width: -4, height: -6)
        customTabBarView.layer.shadowOpacity = 0.5
        customTabBarView.layer.shadowRadius = 3

        view.addSubview(customTabBarView)
        view.bringSubviewToFront(tabBar)
    }

    private func setupCustomTabBarFrame() {
        let height = view.safeAreaInsets.bottom + 60
        var tabFrame = tabBar.frame
        tabFrame.size.height = height
        tabFrame.origin.y = view.frame.size.height - height
        tabBar.frame = tabFrame
        tabBar.setNeedsLayout()
        tabBar.layoutIfNeeded()
        customTabBarView.frame = tabBar.frame
    }
}
