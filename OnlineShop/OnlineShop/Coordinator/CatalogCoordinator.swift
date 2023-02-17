//
//  CatalogCoordinator.swift
//  OnlineShop
//
//  Created by zedsbook on 16.02.2023.
//

import UIKit


class CatalogCoordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() -> CatalogViewController {
        let catalogViewController = CatalogViewController()
        let catalogPresenter = CatalogPresenter()
        let catalogService = MockCatalogService()
        catalogPresenter.catalogService = catalogService
        catalogPresenter.view = catalogViewController
        
        let productDetailsPresenter = ProductDetailsPresenter()
        let productDetailsViewController = ProductDetailsViewController()
        productDetailsPresenter.coordinator = self
        
        catalogPresenter.coordinator = self
        
        productDetailsPresenter.product = nil
        productDetailsPresenter.coordinator = self
        productDetailsViewController.presenter = productDetailsPresenter
        
        catalogViewController.presenter = catalogPresenter
        navigationController.pushViewController(catalogViewController, animated: true)
        
        self.navigationController.setViewControllers([catalogViewController], animated: true)
        return catalogViewController
    }
    
    func showProductDetails(product: Product) {
        let productDetailsPresenter = ProductDetailsPresenter()
        let productDetailsViewController = ProductDetailsViewController()
        productDetailsPresenter.product = product
        productDetailsPresenter.coordinator = self
        productDetailsViewController.presenter = productDetailsPresenter
        productDetailsViewController.hidesBottomBarWhenPushed = true
        
        navigationController.pushViewController(productDetailsViewController, animated: true)
    }
}
