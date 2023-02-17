//
//  ProfileViewController.swift
//  OnlineShop
//
//  Created by zedsbook on 14.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    var authorizationService: AuthorizationService = MockAuthorizationService.shared
    
    @IBAction private func signOut() {
        authorizationService.signOut()
    }
}
