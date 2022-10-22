//
//  NBAPlayer.swift
//  homework6
//
//  Created by zedsbook on 21.10.2022.
//

import UIKit

struct NBAPlayer {
    var name: String
    var season: String
    var position: Position
    var team: String
    var imageOfPerson: UIImage
}

enum Position: String {
    case center = "Центровой"
    case powerForward = "Тяжелый форвард"
    case smallForward = "Легкий форвард"
    case shootingGuard = "Атакующий защитник"
    case pointGuard = "Разыгрывающий защитник"
}

extension NBAPlayer {
    static func getList() -> [NBAPlayer] {
        [
            NBAPlayer(name: "Никола Йокич", season: "2020/21, 2021/22", position: .center, team: "Денвер Наггетс", imageOfPerson: #imageLiteral(resourceName: "Никола Йокич")),
            NBAPlayer(name: "Яннис Адетокунбо", season: "2018/19, 2019/2020", position: .powerForward, team: "Милуоки Бакс", imageOfPerson: #imageLiteral(resourceName: "Янис")),
            NBAPlayer(name: "Джеймс Харден", season: "2017/18", position: .shootingGuard, team: "Филадельфия Сиксерс", imageOfPerson: #imageLiteral(resourceName: "Джеймс")),
            NBAPlayer(name: "Расселл Уэстбрук", season: "2016/17", position: .pointGuard, team: "Лос-Анджелес Лейкерс", imageOfPerson: #imageLiteral(resourceName: "Рассел")),
            NBAPlayer(name: "Стефен Карри", season: "2014/15, 2015/16", position: .pointGuard, team: "Голден Стэйт Уорриорз", imageOfPerson: #imageLiteral(resourceName: "Стефен")),
            NBAPlayer(name: "Кевин Дюрант", season: "2013/14", position: .smallForward, team: "Бруклин Нетс", imageOfPerson: #imageLiteral(resourceName: "Кевин")),
            NBAPlayer(name: "Леброн Джеймс", season: "2008/09, 2009/10, 2011/12, 2012/13", position: .smallForward, team: "Лос-Анджелес Лейкерс", imageOfPerson: #imageLiteral(resourceName: "Леброн")),
            NBAPlayer(name: "Деррик Роуз", season: "2010/11", position: .pointGuard, team: "Нью-Йорк Никс", imageOfPerson: #imageLiteral(resourceName: "Роуз")),
            NBAPlayer(name: "Коби Брайант", season: "2007/08", position: .shootingGuard, team: "Лос-Анджелес Лейкерс", imageOfPerson: #imageLiteral(resourceName: "Коби")),
            NBAPlayer(name: "Дирк Новицки", season: "2006/07", position: .powerForward, team: "Даллас Маверикс", imageOfPerson: #imageLiteral(resourceName: "Дирк")),
            NBAPlayer(name: "Стив Нэш", season: "2004/05, 2005/06", position: .pointGuard, team: "Финикс Санз", imageOfPerson: #imageLiteral(resourceName: "Неш")),
            NBAPlayer(name: "Кевин Гарнетт", season: "2003/04", position: .powerForward, team: "Миннесота Тимбервулвз", imageOfPerson: #imageLiteral(resourceName: "Гарнетт")),
        ]
    }
}
