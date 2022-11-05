//
//  SectionHeader.swift
//  homework8
//
//  Created by zedsbook on 05.11.2022.
//

import Foundation
import UIKit


class SectionHeader: UICollectionReusableView, SelfConfiguringCell {
    static var reuseId: String = "SectionHeader"
    
    func configure(headerName: String) {
        label.text = headerName
        backgroundColor = .systemRed
        setupConstraints()
    }
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "header"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        backgroundColor = .green
        addSubview(label)
    }
    func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                label.topAnchor.constraint(equalTo: self.topAnchor),
                label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                label.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ]
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
