//
//  UserViewController.swift
//  kr1
//
//  Created by zedsbook on 19.11.2022.
//

import UIKit

class UserViewController: UIViewController {
    
    let networkDataFetcher = NetworkDataFetcher()
    var account: Account? = nil
    
    private let tableView: UITableView = .init(frame: .zero, style: .insetGrouped)
    
    func configure(with account: Account?) {
        if let nickname = account?.user.nickname,
           let realName = account?.user.realName,
           let avatar = account?.user.avatar {
            let phoneNumber = account?.user.phoneNumber
            setupNumberAndNickNameLabel(phoneNumber, and: nickname)
            setupImage(withURL: avatar)
            realNameLabel.text = realName
        }
        self.account = account
    }
    
    private func setupNumberAndNickNameLabel(_ firstString: String?, and secondString: String) -> Void {
        if firstString == nil {
            numberAndNickNameLabel.text = secondString
        } else {
            numberAndNickNameLabel.text = "\(firstString!) · \(secondString)"
        }
    }
    
    var realNameLabel: UILabel = {
        let label = UILabel()
        label.text = "realNameLabel"
        label.font = .boldSystemFont(ofSize: 25)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    var numberAndNickNameLabel = {
        let label = UILabel()
        label.text = "something"
        label.font = .systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    var avatarImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Screenshot 2022-11-19 at 16.01.46"))
        imageView.layer.cornerRadius = 75
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private func setupImage(withURL imageURL: String) {
        avatarImage.image = nil
        networkDataFetcher.load(imageView: avatarImage, with: imageURL)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserCell.self, forCellReuseIdentifier: UserCell.cellId)
        tableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        tableView.backgroundColor = .black
        
        view.addSubview(realNameLabel)
        view.addSubview(numberAndNickNameLabel)
        view.addSubview(avatarImage)
        view.addSubview(tableView)
        overrideUserInterfaceStyle = .dark

        setupTableView()
        setupConstraints()
    }
    
    private func setupConstraints() {
        // avatarImage
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                avatarImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                avatarImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                avatarImage.heightAnchor.constraint(equalToConstant: 150),
                avatarImage.widthAnchor.constraint(equalToConstant: 150)
            ]
        )
        
        // realNameLabel
        realNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                realNameLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 20),
                realNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ]
        )
        
        // numberAndNickNameLabel
        numberAndNickNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                numberAndNickNameLabel.topAnchor.constraint(equalTo: realNameLabel.bottomAnchor, constant: 5),
                numberAndNickNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ]
        )
        
        // tableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                tableView.topAnchor.constraint(equalTo: numberAndNickNameLabel.bottomAnchor, constant: 5),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            ]
        )
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = account?.settings[section]
        let row = section?.items.count
        return row ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let section = account?.settings.count
        return section ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.cellId, for: indexPath) as! UserCell
        
        let settings = account?.settings[indexPath.section]
        let items = settings?.items[indexPath.row]
        
        if let name = items?.title,
           let imageURL = items?.icon {
            cell.configure(name: name, imageURL: imageURL)
        }
    
        return cell
    }
    
}
