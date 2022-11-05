//
//  CompositionalViewController.swift
//  homework8
//
//  Created by zedsbook on 04.11.2022.
//

import Foundation
import UIKit

class CompositionalViewController: UIViewController {
    
    private var collectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.addSubview(collectionView)
        
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseId)
        collectionView.register(TeamCell.self, forCellWithReuseIdentifier: TeamCell.reuseId)
        collectionView.register(PlayerCell.self, forCellWithReuseIdentifier: PlayerCell.reuseId)

        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment)  -> NSCollectionLayoutSection? in
            let section = Section.allCases[sectionIndex]
            
            switch section {
            case .teams: return self.createTeamsSection()
            case .players: return self.createPlayersSection()
            }
        }
        return layout
    }
    
    private func createTeamsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(186),
            heightDimension: .absolute(250)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.leading = 20
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(187),
            heightDimension: .absolute(250)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets.top = 20
        return section
    }
    
    private func createPlayersSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(200)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(1)
        )
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.top = 20
        return section
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension CompositionalViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Section.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else { return 0 }
        switch section {
        case .teams: return DataManager.teamsArray.count
        case .players: return DataManager.playersArray.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cellOne = collectionView.dequeueReusableCell(withReuseIdentifier: TeamCell.reuseId, for: indexPath) as! TeamCell
            let team = DataManager.teamsArray[indexPath.row]
            cellOne.configure(withURL: team.imageURL)
            return cellOne
        }
        else {
            let cellTwo = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCell.reuseId, for: indexPath) as! PlayerCell
            let player = DataManager.playersArray[indexPath.row]
            cellTwo.configure(with: player.title, and: player.imageURL)
            return cellTwo
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseId, for: indexPath) as! SectionHeader
            header.configure(headerName: Header.allCases[indexPath.section].rawValue)
            return header
        default:
            return UICollectionReusableView()
        }
    }

}

 

