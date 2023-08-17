//
//  SceneDelegate.swift
//  Top Filmes
//
//  Created by Erick Borges on 04/03/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: CinewatchCoordinator?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        let controller = UINavigationController()
        coordinator = CinewatchCoordinator(navigationController: controller)
        coordinator?.start()

        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}
