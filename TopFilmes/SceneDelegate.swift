//
//  SceneDelegate.swift
//  Top Filmes
//
//  Created by Erick Borges on 04/03/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)

        let controller = UINavigationController()

        let homeCoordinator = HomeCoordinator(navigationController: controller)
        let searchCoordinator = SearchCoordinator(navigationController: controller)
        let favoritesCoordinator = FavoritesCoordinator(navigationController: controller)

        coordinator = Coordinator(homeCoordinator: homeCoordinator,
                                  searchCoordinator: searchCoordinator,
                                  favoritesCoordinator: favoritesCoordinator)
        self.window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
    }
}
