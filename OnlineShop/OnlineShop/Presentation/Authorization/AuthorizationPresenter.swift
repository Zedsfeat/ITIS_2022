//
//  AuthorizationPresenter.swift
//  OnlineShop
//
//  Created by zedsbook on 14.02.2023.
//

import UIKit

class AuthorizationPresenter {
    var authorizationService: AuthorizationService = MockAuthorizationService.shared
    
    weak var view: AuthorizationViewController?
    
    @MainActor
    func logIn(login: String, password: String) {
        view?.showLoader()
        Task {
            do {
                try await authorizationService.signIn(login: login, password: password)
                view?.hideLoader()
            }
            catch {
                view?.show(error: error)
                view?.hideLoader()
            }
        }
    }
}
