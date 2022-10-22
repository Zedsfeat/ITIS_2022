//
//  TableViewCell.swift
//  homework6
//
//  Created by zedsbook on 21.10.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var nbaPlayer: NBAPlayer? {
        didSet {
            nameLabel.text = nbaPlayer?.name
            seasonLabel.text = nbaPlayer?.season
            positionLabel.text = nbaPlayer?.position.rawValue
            teamLabel.text = nbaPlayer?.team
            imageOfPlayer.image = nbaPlayer?.imageOfPerson
        }
    }
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let seasonLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let positionLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 9)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    private let teamLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let imageOfPlayer: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Покемон"))
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        addSubview(nameLabel)
        addSubview(seasonLabel)
        addSubview(positionLabel)
        addSubview(teamLabel)
        addSubview(imageOfPlayer)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        //MARK: - imageOfPlayer Constraints
        imageOfPlayer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                imageOfPlayer.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                imageOfPlayer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                imageOfPlayer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
                imageOfPlayer.widthAnchor.constraint(equalToConstant: 29)
            ]
        )
        
        //MARK: - nameLabel Constraints
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
                nameLabel.leadingAnchor.constraint(equalTo: imageOfPlayer.trailingAnchor, constant: 20),
                nameLabel.heightAnchor.constraint(equalToConstant: 17)
            ]
        )
        
        //MARK: - teamLabel Constraints
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                teamLabel.leadingAnchor.constraint(equalTo: imageOfPlayer.trailingAnchor, constant: 20),
                teamLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                teamLabel.heightAnchor.constraint(equalToConstant: 15)
            ]
        )
        
        //MARK: - positionLabel Constraints
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                positionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
                positionLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 20),
                positionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                positionLabel.heightAnchor.constraint(equalToConstant: 19)
            ]
        )
        
        //MARK: - seasonLabel Constraints
        seasonLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                seasonLabel.topAnchor.constraint(equalTo: teamLabel.bottomAnchor, constant: 0),
                seasonLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
                seasonLabel.leadingAnchor.constraint(equalTo: imageOfPlayer.trailingAnchor, constant: 20),
                seasonLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                seasonLabel.heightAnchor.constraint(equalToConstant: 10)
            ]
        )
    }
}
