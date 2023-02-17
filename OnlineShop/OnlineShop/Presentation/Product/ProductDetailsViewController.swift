//
//  ProductDetailsViewController.swift
//  OnlineShop
//
//  Created by zedsbook on 16.02.2023.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    var presenter: ProductDetailsPresenter?
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = presenter?.product?.name
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nameLabel)
        view.backgroundColor = .white
        nameLabel.frame.size = nameLabel.sizeThatFits(CGSize(width: view.bounds.width, height: .infinity))
            nameLabel.center = view.center
        nameLabel.center = view.center
        setupBackButton()
    }
    
    func setupBackButton() {
        let backButton = UIBarButtonItem(title: "Back",
                                         style: .plain,
                                         target: self,
                                         action: #selector(backButtonTapped))
        self.navigationItem.backBarButtonItem = backButton
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
