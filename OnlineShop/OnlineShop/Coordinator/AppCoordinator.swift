//
//  AppCoordinator.swift
//  OnlineShop
//
//  Created by zedsbook on 14.02.2023.
//

import UIKit
import Combine

@MainActor
class AppCoordinator {
    weak var window: UIWindow?
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    static let shared: AppCoordinator = .init()
    var authorizationService: AuthorizationService = MockAuthorizationService.shared
    var cancellables: Set<AnyCancellable> = []
    
    func start() {
        authorizationService.isAuthorized
            .receive(on: DispatchQueue.main)
            .sink { [ weak self ] authorized in
                guard let self else { return }
                if authorized {
                    self.showAppContent()
                } else {
                    self.showAuthorization()
                }
            }
            .store(in: &cancellables)
    }
    
    func showAuthorization() {
        let controller = storyboard.instantiateViewController(withIdentifier: "AuthorizationViewController") as! AuthorizationViewController
        let presenter = AuthorizationPresenter()
        controller.presenter = presenter
        presenter.view = controller
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
    
    func showAppContent() {
        let tabBarCoordinator = MainTabBarCoordinator()
        window?.rootViewController = tabBarCoordinator.start()
    }
}

