//
//  UserCell.swift
//  kr1
//
//  Created by zedsbook on 19.11.2022.
//

import UIKit

class UserCell: UITableViewCell {
    
    let networkDataFetcher = NetworkDataFetcher()
    
    
    static var cellId = "userID"
    
    func configure(name: String, imageURL: String) {
        nameLabel.text = name
        setupImage(withURL: imageURL)
    }
    
    private func setupImage(withURL imageURL: String) {
        imageSettings.image = nil
        networkDataFetcher.load(imageView: imageSettings, with: imageURL)
    }
        
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    private let imageSettings: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        addSubview(nameLabel)
        addSubview(imageSettings)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        // imageView
        imageSettings.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                imageSettings.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                imageSettings.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                imageSettings.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                imageSettings.widthAnchor.constraint(equalToConstant: 40),
                imageSettings.heightAnchor.constraint(equalToConstant: 40)
            ]
        )
        
        // trackLabel
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                nameLabel.leadingAnchor.constraint(equalTo: imageSettings.trailingAnchor, constant: 20),
                nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
                nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            ]
        )
    }
}
