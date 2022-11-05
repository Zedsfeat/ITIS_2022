//
//  TeamCell.swift
//  homework8
//
//  Created by zedsbook on 04.11.2022.
//

import Foundation
import UIKit

class TeamCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseId: String = "TeamCell"
    
    func configure(withURL imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        loadImage(url: url)
    }
    
    private var dataTask: URLSessionDataTask?
    
    var nbaTeam: TeamModel? {
        didSet {
            teamLabel.text = nbaTeam?.title
            teamImageView.image = nbaTeam?.image
        }
    }
    
    let teamLabel = UILabel()
    let teamImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
        setupImageView()
        setupConstraints()
    }
    
    func setupCell() {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 2
        self.clipsToBounds = true
    }
    
    func setupImageView() {
        
        teamImageView.contentMode = .scaleAspectFit
        teamImageView.backgroundColor = .clear
        addSubview(teamImageView)
        
    }

    func setupConstraints() {
        // Image
        teamImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                teamImageView.topAnchor.constraint(equalTo: self.topAnchor),
                teamImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                teamImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                teamImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ]
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadImage(url: URL) {
            teamImageView.image = nil
            dataTask?.cancel()
            let urlRequest = URLRequest(
                url: url,
                cachePolicy: .reloadIgnoringLocalAndRemoteCacheData
            )
            dataTask = URLSession.shared
                .dataTask(with: urlRequest) { [teamImageView] data, _, _ in
                    guard let data else {
                        return
                    }

                    let image = UIImage(data: data)
                    DispatchQueue.main.async { [teamImageView] in
                        guard let image else { return }
                        teamImageView.image = image
                    }
                }
            dataTask?.resume()
        }
}


