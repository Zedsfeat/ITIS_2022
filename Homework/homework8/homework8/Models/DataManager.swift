//
//  DataManager.swift
//  homework8
//
//  Created by zedsbook on 05.11.2022.
//

import Foundation

struct DataManager {
    static var teamsArray: [TeamModel] = {
        [
            TeamModel(title: "ДЕНВЕР НАГГЕТС", image: #imageLiteral(resourceName: "nba-denver-nuggets-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-denver-nuggets-logo-2018-768x768.png"),
            TeamModel(title: "МИННЕСОТА ТИМБЕРВУЛВЗ", image: #imageLiteral(resourceName: "nba-minnesota-timberwolves-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-minnesota-timberwolves-logo-768x768.png"),
            TeamModel(title: "ОКЛАХОМА-СИТИ ТАНДЕР", image: #imageLiteral(resourceName: "nba-oklahoma-city-thunder-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-oklahoma-city-thunder-logo-768x768.png"),
            TeamModel(title: "ПОРТЛЕНД ТРЭЙЛ БЛЭЙЗЕРС", image: #imageLiteral(resourceName: "nba-portland-trail-blazers-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-portland-trail-blazers-logo-768x768.png"),
            TeamModel(title: "ЮТА ДЖАЗ", image: #imageLiteral(resourceName: "nba-utah-jazz-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/Utah_Jazz_logo_2022-768x768.png"),
            TeamModel(title: "ГОЛДЕН СТЭЙТ УОРРИОРЗ", image: #imageLiteral(resourceName: "nba-golden-state-warriors-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-golden-state-warriors-logo-2020-768x768.png"),
            TeamModel(title: "ЛОС-АНДЖЕЛЕС КЛИППЕРС", image: #imageLiteral(resourceName: "nba-la-clippers-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-la-clippers-logo-768x768.png"),
            TeamModel(title: "ЛОС-АНДЖЕЛЕС ЛЕЙКЕРС", image: #imageLiteral(resourceName: "nba-los-angeles-lakers-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-los-angeles-lakers-logo-768x768.png"),
            TeamModel(title: "САКРАМЕНТО КИНГЗ", image: #imageLiteral(resourceName: "nba-sacramento-kings-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-sacramento-kings-logo-768x768.png"),
            TeamModel(title: "ФИНИКС САНЗ", image: #imageLiteral(resourceName: "nba-phoenix-suns-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-phoenix-suns-logo-768x768.png"),
            TeamModel(title: "ДАЛЛАС МАВЕРИКС", image: #imageLiteral(resourceName: "nba-dallas-mavericks-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-dallas-mavericks-logo-768x768.png"),
            TeamModel(title: "МЕМФИС ГРИЗЗЛИС", image: #imageLiteral(resourceName: "nba-memphis-grizzlies-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-memphis-grizzlies-logo-768x768.png"),
            TeamModel(title: "НЬЮ-ОРЛЕАН ПЕЛИКАНС", image: #imageLiteral(resourceName: "nba-new-orleans-pelicans-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-new-orleans-pelicans-logo-768x768.png"),
            TeamModel(title: "САН-АНТОНИО СПЁРС", image: #imageLiteral(resourceName: "nba-san-antonio-spurs-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-san-antonio-spurs-logo-768x768.png"),
            TeamModel(title: "ХЬЮСТОН РОКЕТС", image: #imageLiteral(resourceName: "nba-houston-rockets-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-houston-rockets-logo-2020-300x300.png"),
            TeamModel(title: "БОСТОН СЕЛТИКС", image: #imageLiteral(resourceName: "nba-boston-celtics-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-boston-celtics-logo-768x768.png"),
            TeamModel(title: "БРУКЛИН НЕТС", image: #imageLiteral(resourceName: "nba-brooklyn-nets-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-brooklyn-nets-logo-768x768.png"),
            TeamModel(title: "НЬЮ-ЙОРК НИКС", image: #imageLiteral(resourceName: "nba-new-york-knicks-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-new-york-knicks-logo-768x768.png"),
            TeamModel(title: "ТОРОНТО РЭПТОРС", image: #imageLiteral(resourceName: "nba-toronto-raptors-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-toronto-raptors-logo-2020-768x768.png"),
            TeamModel(title: "ФИЛАДЕЛЬФИЯ СИКСЕРС", image: #imageLiteral(resourceName: "nba-philadelphia-76-ers-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-philadelphia-76ers-logo-768x768.png"),
            TeamModel(title: "ДЕТРОЙТ ПИСТОНС", image: #imageLiteral(resourceName: "nba-detroit-pistons-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-detroit-pistons-logo-768x768.png"),
            TeamModel(title: "ИНДИАНА ПЭЙСЕРС", image: #imageLiteral(resourceName: "nba-indiana-pacers-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-indiana-pacers-logo-768x768.png"),
            TeamModel(title: "КЛИВЛЕНД КАВАЛЬЕРС", image: #imageLiteral(resourceName: "nba-cleveland-cavaliers-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/Clevelan-Cavaliers-logo-2022-768x768.png"),
            TeamModel(title: "МИЛУОКИ БАКС", image: #imageLiteral(resourceName: "nba-milwaukee-bucks-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-milwaukee-bucks-logo-768x768.png"),
            TeamModel(title: "ЧИКАГО БУЛЛЗ", image: #imageLiteral(resourceName: "nba-chicago-bulls-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-chicago-bulls-logo-768x768.png"),
            TeamModel(title: "АТЛАНТА ХОКС", image: #imageLiteral(resourceName: "nba-atlanta-hawks-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-atlanta-hawks-logo-768x768.png"),
            TeamModel(title: "ВАШИНГТОН УИЗАРДС", image: #imageLiteral(resourceName: "nba-washington-wizards-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-washington-wizards-logo-768x768.png"),
            TeamModel(title: "МАЙАМИ ХИТ", image: #imageLiteral(resourceName: "nba-miami-heat-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-miami-heat-logo-768x768.png"),
            TeamModel(title: "ОРЛАНДО МЭДЖИК", image: #imageLiteral(resourceName: "nba-orlando-magic-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-orlando-magic-logo-768x768.png"),
            TeamModel(title: "ШАРЛОТТ ХОРНЕТС", image: #imageLiteral(resourceName: "nba-charlotte-hornets-768x768"), imageURL: "https://loodibee.com/wp-content/uploads/nba-charlotte-hornets-logo-768x768.png"),
        ]
    }()
    
    static var playersArray: [PlayerModel] = {
        [
            PlayerModel(title: "Никола Йокич", image: #imageLiteral(resourceName: "1769340811_0-73-2049-1225_1280x0_80_0_0_1b07d983cf8ef30d75e722cf5554f1ba"), imageURL: "https://cdnn21.img.ria.ru/images/07e6/01/18/1769340811_0:73:2049:1225_1280x0_80_0_0_1b07d983cf8ef30d75e722cf5554f1ba.jpg"),
            PlayerModel(title: "Яннис Адетокунбо", image: #imageLiteral(resourceName: "1563038218_0-0-3071-1728_600x0_80_0_0_9067812180c8c18d18c4cb9792b8c178"), imageURL: "https://cdnn21.img.ria.ru/images/156303/82/1563038218_0:0:3071:1728_600x0_80_0_0_9067812180c8c18d18c4cb9792b8c178.jpg"),
            PlayerModel(title: "Джеймс Харден", image: #imageLiteral(resourceName: "james-harden-cropped_adrrcka6po2g1feaaueg721vj"), imageURL: "https://stadiumastro-kentico.s3.amazonaws.com/stadiumastro/media/perform-article/2019/jan/18/james-harden-cropped_adrrcka6po2g1feaaueg721vj.jpg"),
            PlayerModel(title: "Расселл Уэстбрук", image: #imageLiteral(resourceName: "russell-westbrook-h-town-white-jersey-8t5w9hldeh9ccxff-8t5w9hldeh9ccxff"), imageURL: "https://wallpapers.com/images/hd/russell-westbrook-h-town-white-jersey-8t5w9hldeh9ccxff.jpg"),
            PlayerModel(title: "Стефен Карри", image: #imageLiteral(resourceName: "stephen_curry_is_standing_in_black_background_wearing_white_sports_dress_hd_stephen_curry"), imageURL: "https://www.hdwallpapers.in/download/stephen_curry_is_standing_in_black_background_wearing_white_sports_dress_hd_stephen_curry-HD.jpg"),
            PlayerModel(title: "Кевин Дюрант", image: #imageLiteral(resourceName: "17000694"), imageURL: "https://wallpaper.dog/large/17000694.jpg"),
            PlayerModel(title: "Леброн Джеймс", image: #imageLiteral(resourceName: "1596151204_0-0-2049-1152_1280x0_80_0_0_bb5eae6ce6de0b153c6c304c8bbf1a19"), imageURL: "https://cdnn21.img.ria.ru/images/07e5/02/05/1596151204_0:0:2049:1152_1280x0_80_0_0_bb5eae6ce6de0b153c6c304c8bbf1a19.jpg"),
            PlayerModel(title: "Деррик Роуз", image: #imageLiteral(resourceName: "58f4f7a9-4a6d-4016-b9d8-ccce5572095c"), imageURL: "https://pictures.by.tribuna.com/image/58f4f7a9-4a6d-4016-b9d8-ccce5572095c"),
            PlayerModel(title: "Коби Брайант", image: #imageLiteral(resourceName: "136276-basketbol-losandzheles_lejkers-komandnyj_vid_sporta-igra_s_myachom-igrok-1920x1080"), imageURL: "https://img3.akspic.ru/crops/6/7/2/6/3/136276/136276-basketbol-losandzheles_lejkers-komandnyj_vid_sporta-igra_s_myachom-igrok-1920x1080.jpg"),
            PlayerModel(title: "Дирк Новицки", image: #imageLiteral(resourceName: "9837521-nba-new-york-knicks-at-dallas-mavericks"), imageURL: "https://thunderousintentions.com/wp-content/uploads/usat-images/2017/06/9837521-nba-new-york-knicks-at-dallas-mavericks.jpeg"),
            PlayerModel(title: "Стив Нэш", image: #imageLiteral(resourceName: "366002"), imageURL: "https://wallpaperset.com/w/full/7/2/2/366002.jpg"),
            PlayerModel(title: "Кевин Гарнетт", image: #imageLiteral(resourceName: "GettyImages-72818723 (1)"), imageURL: "https://library.sportingnews.com/styles/twitter_card_120x120/s3/2022-03/GettyImages-72818723%20%281%29.jpg?itok=OMaj5EMU"),
        ]
    }()
}


