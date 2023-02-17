//
//  CatalogService.swift
//  OnlineShop
//
//  Created by zedsbook on 16.02.2023.
//

import Foundation

protocol CatalogService {
    func loadCatalog(completion: @escaping ([Product]?) -> Void)
}

class MockCatalogService: CatalogService {
    func loadCatalog(completion: @escaping ([Product]?) -> Void) {
        let products = [
            Product(name: "Product 1", description: "Product 1 description", imageURL: "http://example.com/product1"),
            Product(name: "Product 2", description: "Product 2 description", imageURL: "http://example.com/product2"),
            Product(name: "Product 3", description: "Product 3 description", imageURL: "http://example.com/product3"),
            Product(name: "Product 4", description: "Product 3 description", imageURL: "http://example.com/product3"),
            Product(name: "Product 5", description: "Product 3 description", imageURL: "http://example.com/product3")
        ]
        completion(products)
    }
}
