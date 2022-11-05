//
//  PlayerCell.swift
//  homework8
//
//  Created by zedsbook on 04.11.2022.
//

import Foundation
import UIKit

class PlayerCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseId: String = "PlayerCell"
    
    func configure(with title: String, and imageURL: String) {
        playerLabel.text = "  " + title + "  "
        guard let url = URL(string: imageURL) else { return }
        loadImage(url: url)
    }
    
    private var dataTask: URLSessionDataTask?
    
    var nbaPlayer: PlayerModel? {
        didSet {
            playerLabel.text = nbaPlayer?.title
            playerImageView.image = nbaPlayer?.image
        }
    }
    
    let playerImageView = UIImageView()
    let playerLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
        setupImageView()
        setupLabel()
        setupConstraints()
    }
    
    func setupCell() {
        self.clipsToBounds = true
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    func setupImageView() {
        
        playerImageView.clipsToBounds = true
        playerImageView.layer.cornerRadius = 10
        playerImageView.contentMode = .scaleAspectFill
        playerImageView.backgroundColor = .white
        addSubview(playerImageView)
        
    }
    
    
    func setupLabel() {
        
        playerLabel.clipsToBounds = true
        playerLabel.backgroundColor = .white
        playerLabel.layer.cornerRadius = 5
        playerLabel.alpha = 0.75
        
        playerLabel.font = .boldSystemFont(ofSize: 20)
        playerLabel.textAlignment = .left
        playerLabel.numberOfLines = 0
        addSubview(playerLabel)
        
    }

    //MARK: - Setup Constraints
    func setupConstraints() {
        // Image
        playerImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                playerImageView.topAnchor.constraint(equalTo: self.topAnchor),
                playerImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                playerImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                playerImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ]
        )
        
        // Label
        playerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                playerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
                playerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12)
            ]
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadImage(url: URL) {
            playerImageView.image = nil
            dataTask?.cancel()
            let urlRequest = URLRequest(
                url: url,
                cachePolicy: .reloadIgnoringLocalAndRemoteCacheData
            )
            dataTask = URLSession.shared.dataTask(with: urlRequest) { [playerImageView] data, _, _ in
                    guard let data else { return }
                    let image = UIImage(data: data)
                    DispatchQueue.main.async { [playerImageView] in
                        guard let image else { return }
                        playerImageView.image = image
                    }
                }
            dataTask?.resume()
    }
}
