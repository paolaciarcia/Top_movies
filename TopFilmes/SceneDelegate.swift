//
//  SceneDelegate.swift
//  Top Filmes
//
//  Created by Erick Borges on 04/03/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootController = TabBarController()
        self.window?.rootViewController = rootController
        window?.makeKeyAndVisible()
        window?.windowScene = windowScene
    }
}
