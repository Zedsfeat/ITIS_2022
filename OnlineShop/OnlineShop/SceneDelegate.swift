//
//  SceneDelegate.swift
//  OnlineShop
//
//  Created by zedsbook on 14.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        let coordinator: AppCoordinator = .shared
        coordinator.window = window
        coordinator.start()
        self.window = window
    }
}

