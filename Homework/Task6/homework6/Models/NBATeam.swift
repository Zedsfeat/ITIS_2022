//
//  Track.swift
//  homework6
//
//  Created by zedsbook on 21.10.2022.
//

import UIKit

struct NBATeam {
    let name: String
    let conference: Conference
    let image: UIImage
    var championshipYear: String?
    
    var championshipTitle: String? {
        if let championshipYear { return "🏆 \(championshipYear)" }
        return nil
    }
    
    
}


enum Conference: String {
    case west = "Запад"
    case east = "Восток"
}

extension NBATeam {
    static func getList() -> [NBATeam] {
        [
            //MARK: - Западная конференция
            NBATeam(name: "ЮТА ДЖАЗ", conference: .west, image: #imageLiteral(resourceName: "nba-utah-jazz-768x768")),
            NBATeam(name: "ГОЛДЕН СТЭЙТ УОРРИОРЗ", conference: .west, image: #imageLiteral(resourceName: "nba-golden-state-warriors-768x768"), championshipYear: "2021/22"),
            NBATeam(name: "ЛОС-АНДЖЕЛЕС КЛИППЕРС", conference: .west, image: #imageLiteral(resourceName: "nba-la-clippers-768x768")),
            NBATeam(name: "ЛОС-АНДЖЕЛЕС ЛЕЙКЕРС", conference: .west, image: #imageLiteral(resourceName: "nba-los-angeles-lakers-768x768"), championshipYear: "2019/20"),
            NBATeam(name: "САКРАМЕНТО КИНГЗ", conference: .west, image: #imageLiteral(resourceName: "nba-sacramento-kings-768x768")),

            //MARK: - Восточная конференция
            NBATeam(name: "ИНДИАНА ПЭЙСЕРС", conference: .east, image: #imageLiteral(resourceName: "nba-indiana-pacers-768x768")),
            NBATeam(name: "КЛИВЛЕНД КАВАЛЬЕРС", conference: .east, image: #imageLiteral(resourceName: "nba-cleveland-cavaliers-768x768")),
            NBATeam(name: "МИЛУОКИ БАКС", conference: .east, image: #imageLiteral(resourceName: "nba-milwaukee-bucks-768x768"), championshipYear: "2020/21"),
            NBATeam(name: "ЧИКАГО БУЛЛЗ", conference: .east, image: #imageLiteral(resourceName: "nba-chicago-bulls-768x768")),
            NBATeam(name: "АТЛАНТА ХОКС", conference: .east, image: #imageLiteral(resourceName: "nba-atlanta-hawks-768x768")),
        ]
    }
}
