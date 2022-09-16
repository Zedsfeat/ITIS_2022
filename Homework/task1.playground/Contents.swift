//Описать игру в стиле DnD.
//Должны быть персонажи разных классов, которые заранее генерируются (можно с помощью Random, можно руками). У Персонажей как минимум должен быть уровень жизни (HP), может быть уровень маны (MP), какие-то способности. Одной из способностей одного из персонажей должна быть способность, которая отражает способность противника.
//Должны быть разные монстры, тоже с уровнями HP, MP и способностями.
//Персонажи в ходе игры автоматически должны (действия происходят в каком вам угодно)
// 1 - идти (куда-то, не важно, вперёд);
// 2 - что-то находить (полезное или не очень);
// 3 - сражаться с рандомными группами монстров (пока монстры или герои не погибнут);
//Постарайтесь побольше использовать разных типов, class, struct, enum, protocol
//Выводите логи игры в консоль с помощью print()
//Если герои живут слишком долго, пусть игра заканчивается на 100-м ходу.




protocol Creature {
    var HP: Double { get set }
    var MP: Double { get set }
    
    func getInfo() -> Void
}

protocol AbilitiesOfHeroes {
    func move(somewhere: DirectionOfMovement, by points: Double) -> Void
    func find(loot: Loot) -> Void
    func hit(monster: Monster, by points: Double) -> Void
    func heal(hero: Hero, by points: Double) -> Void
}

protocol AbilitiesOfMonsters {
    func hit(hero: Hero, by points: Double) -> Void
}

protocol ProtocolForHero {
    var name: String { get }
    var type: HeroTypes { get }
    var equipment: [Loot] { get set }
}

protocol ProtocolForMonster {
    var name: String { get }
    var type: MonsterTypes { get }
}

enum DirectionOfMovement {
    case forward, backward, left, right
}

enum HeroTypes {
    case mage, assassin, tank, warrior, support
}

enum MonsterTypes {
    case dragon, zombie, vampire, alien
}

enum Loot {
    case sword, hammer, healKit, manaKit, stone
}


class Hero: Creature, ProtocolForHero, AbilitiesOfHeroes {
    var name: String
    var type: HeroTypes
    var equipment: [Loot]
    
    var HP: Double
    var MP: Double
    
    init(name: String, type: HeroTypes) {
        self.name = name
        self.type = type
        self.equipment = []
        self.HP = 100
        self.MP = 200
    }
    
    
    func move(somewhere: DirectionOfMovement, by points: Double) -> Void {
        if self.HP != 0.0 {
            switch somewhere {
            case .forward: print("\(name) move forward by \(points) points...")
            case .backward: print("\(name) move backward by \(points) points...")
            case .left: print("\(name) move left by \(points) points...")
            case .right: print("\(name) move right by \(points) points...")
            }
        } else {
            print("\(self.name) is already dead, he/she cannot be move...")
        }
    }
    
    func find(loot: Loot) -> Void {
        self.equipment.append(loot)
        switch loot {
        case .sword: print("\(self.name) found and added a sword to equipment...")
        case .hammer: print("\(self.name) found and added a hammer to equipment...")
        case .healKit: print("\(self.name) found and added a heal kit to equipment...")
        case .manaKit: print("\(self.name) found and added a mana kit to equipment...")
        case .stone: print("\(self.name) found and added a stone to equipment...")
        }
    }
    
    func hit(monster: Monster, by points: Double) -> Void {
        if monster.HP != 0 {
            if (self.MP - 10) > 0 {
                self.MP = self.MP - 10
                print("\(self.name) spent 10 MP...")
            } else {
                print("\(self.name) can't hit \(monster.name)")
                return
            }
            
            if (monster.HP - points) > 0 {
                monster.HP = monster.HP - points
            } else {
                monster.HP = 0
            }
            print("\(self.name) hit \(monster.name) by \(points) points...")
            print("\(monster.name) has \(monster.HP) HP...")
        } else {
            print("\(monster.name) is already dead, it cannot be hit...")
        }
    }
    
    func heal(hero: Hero, by points: Double) -> Void {
        if (self.MP - 20) > 0 {
            self.MP = self.MP - 20
            print("\(self.name) spent 20 MP...")
        } else {
            print("\(self.name) can't heal \(hero.name)")
            return
        }
        
        if (hero.HP + points) < 100 {
            hero.HP = hero.HP + points
            print("\(self.name) heal \(hero.name) by \(points) points...")
        } else {
            hero.HP = 100
        }
        print("\(hero.name) has \(hero.HP) HP...")
    }
    
    func getInfo() -> Void {
        print("This is \(name) of \(type) type with \(HP) HP and \(MP) MP...")
    }
}


class Monster: Creature, ProtocolForMonster, AbilitiesOfMonsters {
    var name: String
    var type: MonsterTypes
    
    var HP: Double
    var MP: Double
    
    init(name: String, type: MonsterTypes) {
        self.name = name
        self.type = type
        self.HP = 100
        self.MP = 100
    }
    
    func hit(hero: Hero, by points: Double) -> Void {
        if hero.HP != 0 {
            if (self.MP - 20) > 0 {
                self.MP = self.MP - 20
                print("\(self.name) spent 20 MP...")

            } else {
                print("\(self.name) can't hit \(hero.name)")
                return
            }
            
            if (hero.HP - points) > 0 {
                hero.HP = hero.HP - points
            } else {
                hero.HP = 0
            }
            print("\(self.name) hit \(hero.name) by \(points) points...")
            print("\(hero.name) has \(hero.HP) HP...")
        } else {
            print("\(hero.name) is already dead, he/she cannot be hit...")
        }
    }
    
    func getInfo() -> Void {
        print("This is \(name) of \(type) type with \(HP) HP and \(MP) MP...")
    }
}


let assasin = Hero(name: "Ezio", type: .assassin)
let mage = Hero(name: "Lux", type: .mage)
let tank = Hero(name: "Orn", type: .tank)
let warrior = Hero(name: "Lee Sin", type: .warrior)
let support = Hero(name: "Leona", type: .support)

let dragon = Monster(name: "Dragon", type: .dragon)
let zombie = Monster(name: "Zombie", type: .zombie)
let vampire = Monster(name: "Vampire", type: .vampire)
let alien = Monster(name: "Alien", type: .alien)


let arrayOfHeroes: Array<Hero> = [assasin, mage, tank, warrior, support]
let arrayOfMonster: Array<Monster> = [dragon, zombie, vampire, alien]
let arrayOfDirectionOfMovement: Array<DirectionOfMovement> = [.forward, .backward, .left, .right]
let arrayOfLoot: Array<Loot> = [.sword, .hammer, .healKit, .manaKit, .stone]


for number in 1...100 {
    
    print("-------------------------\(number) round!-------------------------")
    
    // Finds by heroes
    arrayOfHeroes[Int.random(in: 0...4)].find(loot: arrayOfLoot[Int.random(in: 0...4)])
    
    // Hits by heroes
    arrayOfHeroes[Int.random(in: 0...4)].hit(monster: arrayOfMonster[Int.random(in: 0...3)], by: Double.random(in: 1...30))

    // Hits by monsters
    arrayOfMonster[Int.random(in: 0...3)].hit(hero: arrayOfHeroes[Int.random(in: 0...4)], by: Double.random(in: 1...15))
    
    // Moves by heroes
    arrayOfHeroes[Int.random(in: 0...4)].move(somewhere: arrayOfDirectionOfMovement[Int.random(in: 0...3)], by: Double.random(in: 0...50))
    
    // Heals by heroes
    arrayOfHeroes[Int.random(in: 0...4)].heal(hero: arrayOfHeroes[Int.random(in: 0...4)], by: Double.random(in: 1...10))
    
    // Hits by monsters
    arrayOfMonster[Int.random(in: 0...3)].hit(hero: arrayOfHeroes[Int.random(in: 0...4)], by: Double.random(in: 1...10))
    
    // Hits by heroes
    arrayOfHeroes[Int.random(in: 0...4)].hit(monster: arrayOfMonster[Int.random(in: 0...3)], by: Double.random(in: 1...20))
}

print("-------------------------Information about heroes and monsters!-------------------------")

assasin.getInfo()
mage.getInfo()
tank.getInfo()
warrior.getInfo()
support.getInfo()


dragon.getInfo()
zombie.getInfo()
vampire.getInfo()
alien.getInfo()
