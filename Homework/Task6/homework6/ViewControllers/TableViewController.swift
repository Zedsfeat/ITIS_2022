//
//  TableViewController.swift
//  homework6
//
//  Created by zedsbook on 21.10.2022.
//

import UIKit
import Foundation

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let nbaTeamsList = NBATeam.getList()
    private let nbaPlayersList = NBAPlayer.getList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    private let tableView: UITableView = .init(frame: .zero, style: .grouped)
    
    //MARK: - Set Up
    private func setUp() {
        //MARK: - Add on view tableView
        view.addSubview(tableView)
        
        //MARK: - Register Table View Cell with CellTwoID
        tableView.register(TableViewCell.self, forCellReuseIdentifier: Identifier.cellTwo.rawValue)
        
        
        //MARK: - Background colors
        view.backgroundColor = .white
        tableView.backgroundColor = .clear
        
        //MARK: - tableView separator
        tableView.separatorColor = #colorLiteral(red: 0.2745098039, green: 0.2745098039, blue: 0.2745098039, alpha: 1)
        tableView.separatorInset = .init(top: 0, left: 15, bottom: 0, right: 15)
        
        //MARK: - tableView Protocols
        tableView.dataSource = self
        tableView.reloadData()
        tableView.delegate = self
        
        //MARK: - tableView Constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ]
        )
    }
    
    //MARK: - Enum Identifier
    private enum Identifier: String {
        case cellOne
        case cellTwo
    }
    
    //MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return nbaTeamsList.count
        }
        else {
            return nbaPlayersList.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Команды NBA"
        default: return "MVP Игроки"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            //MARK: - Cell One
            let cellOne = UITableViewCell(style: .value1, reuseIdentifier: Identifier.cellOne.rawValue)
            var content = cellOne.defaultContentConfiguration()
            
            let nbaTeam = nbaTeamsList[indexPath.row]
            // First text
            content.text = nbaTeam.name
            content.textProperties.font = .boldSystemFont(ofSize: 15)
            content.textProperties.color = #colorLiteral(red: 0.2745098039, green: 0.2745098039, blue: 0.2745098039, alpha: 1)
            // Second text
            content.secondaryText = nbaTeam.championshipTitle
            content.secondaryTextProperties.font = .boldSystemFont(ofSize: 15)
            content.secondaryTextProperties.color = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            // image
            content.image = nbaTeam.image
            
            cellOne.contentConfiguration = content
            return cellOne
        }
        
        else {
            //MARK: - Cell Two
            let cellTwo = tableView.dequeueReusableCell(withIdentifier: Identifier.cellTwo.rawValue, for: indexPath) as! TableViewCell
            let player = nbaPlayersList[indexPath.row]
            cellTwo.nbaPlayer = player
            return cellTwo
            
        }
    }

    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 50
        default: return 70
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
        case 1: print( "\(describe(player: nbaPlayersList[indexPath.row]))" )
        default: break
        }
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        switch indexPath.section {
        case 0: return false
        default: return true
        }
    }
    
    //MARK: - Description of player
    private func describe(player: NBAPlayer) -> String {
        let name = player.name
        let season = player.season
        let position = player.position.rawValue.lowercased()
        let team = player.team
        
        return "Это игрок NBA \(name), который играет за команду \(team) на позиции \(position).\nПолучил награду МВП в \(season) годах."
    }
}
