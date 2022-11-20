//
//  AccountCell.swift
//  kr1
//
//  Created by zedsbook on 19.11.2022.
//

import UIKit

class AccountCell: UITableViewCell {
    
    static var cellId = "accountID"
    
    func configure(name: String) {
        nameLabel.text = name
    }
        
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        addSubview(nameLabel)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        // nameLabel
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                nameLabel.widthAnchor.constraint(equalToConstant: 40),
                nameLabel.heightAnchor.constraint(equalToConstant: 40)
            ]
        )
        
        
    }
}


