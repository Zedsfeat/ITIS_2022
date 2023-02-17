//
//  CatalogViewController.swift
//  OnlineShop
//
//  Created by zedsbook on 14.02.2023.
//

import UIKit


class CatalogViewController: UIViewController {
    var presenter: CatalogPresenter?
    var products: [Product] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRectZero, style: .insetGrouped)
        tableView.separatorInset = .zero
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        navigationItem.title = "Catalog"
        navigationController?.navigationBar.prefersLargeTitles = true
        presenter?.viewDidLoad()
    }
}

extension CatalogViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = products[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectProduct(products[indexPath.row])
    }
}
