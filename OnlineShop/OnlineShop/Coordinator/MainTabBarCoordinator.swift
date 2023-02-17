//
//  MainTabBarCoordinator.swift
//  OnlineShop
//
//  Created by zedsbook on 14.02.2023.
//

import UIKit

class MainTabBarCoordinator {
    weak var tabBarController: UITabBarController?
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    func start() -> UIViewController {
        let tabBarController = UITabBarController()
        self.tabBarController = tabBarController
        tabBarController.viewControllers = [
            shopping(),
            profile()
        ]
        return tabBarController
    }
    
    private func shopping() -> UIViewController {
        let navigationController = UINavigationController()
        let catalogCoordinator = CatalogCoordinator(navigationController: navigationController)
        let catalogViewController = catalogCoordinator.start()
        catalogViewController.tabBarItem = .init(
            title: "Catalog",
            image: .init(systemName: "cart"),
            selectedImage: .init(systemName: "cart.fill")
        )
        return navigationController
    }
    
    private func profile() -> UIViewController {
        let controller = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        controller.tabBarItem = .init(
            title: "Profile ",
            image: .init(systemName: "person.circle"),
            selectedImage: .init(systemName: "person.circle.fill")
        )
        return controller
    }
}
