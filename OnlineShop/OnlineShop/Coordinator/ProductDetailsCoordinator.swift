//
//  ProductDetailsCoordinator.swift
//  OnlineShop
//
//  Created by zedsbook on 16.02.2023.
//

import UIKit

class ProductDetailsCoordinator {
    var navigationController: UINavigationController?

    func start(with product: Product) {
        let detailsVC = ProductDetailsViewController()
        let presenter = ProductDetailsPresenter()
        presenter.product = product
        detailsVC.presenter = presenter
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
