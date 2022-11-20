//
//  AccountTableViewController.swift
//  kr1
//
//  Created by zedsbook on 19.11.2022.
//

import UIKit

class AccountViewController: UIViewController {
    
    let networkDataFetcher = NetworkDataFetcher()
    var accountResponse: AccountResponse? = nil
    
    private let tableView: UITableView = .init(frame: .zero, style: .insetGrouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        overrideUserInterfaceStyle = .dark
        setupAccounts()
        setupTableView()
        setupConstraints()
    }
    
    private func setupAccounts() {
        let urlString = "https://raw.githubusercontent.com/AZigangaraev/images/main/telegram.json"
        networkDataFetcher.fetchData(with: urlString) { [weak self] accountResponse in
            self?.accountResponse = accountResponse
            self?.tableView.reloadData()
        }
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AccountCell.self, forCellReuseIdentifier: AccountCell.cellId)
        tableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                tableView.topAnchor.constraint(equalTo: view.topAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ]
        )
    }
}

//MARK: - UITableViewDelegate & UITableViewDataSource
extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountResponse?.accounts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountCell.cellId, for: indexPath) as! AccountCell
        
        let accounts = accountResponse?.accounts[indexPath.row]

        if let name = accounts?.user.realName {
            cell.configure(name: name)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let account = accountResponse?.accounts[indexPath.row]
        
        let userVC = UserViewController()
        userVC.configure(with: account)
        
        userVC.modalTransitionStyle = .coverVertical
        present(userVC, animated: true)
    }
}
