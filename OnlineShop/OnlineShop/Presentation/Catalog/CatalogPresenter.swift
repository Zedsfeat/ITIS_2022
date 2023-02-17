//
//  CatalogPresenter.swift
//  OnlineShop
//
//  Created by zedsbook on 16.02.2023.
//

import Foundation

class CatalogPresenter {
    var view: CatalogViewController?
    var catalogService: CatalogService?
    var coordinator: CatalogCoordinator?
    
    func viewDidLoad() {
        catalogService?.loadCatalog(completion: { [weak self] products in
            self?.view?.products = products ?? []
            self?.view?.tableView.reloadData()
        })
    }

    func didSelectProduct(_ product: Product) {
        coordinator?.showProductDetails(product: product)
    }
}
