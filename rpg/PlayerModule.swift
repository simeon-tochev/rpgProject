
class PlayerDefault: Player {
    var name: String = ""
    var hero: Hero = Human()
    var isAlive: Bool = true
}

struct PlayerGen: PlayerGenerator {
    var heroGenerator: HeroGenerator
    init(heroGenerator: HeroGenerator) {
        self.heroGenerator = heroGenerator
    }
    
    func generatePlayer(name: String) -> Player {
        let player = PlayerDefault()
        print("Въведете име на играч: ")
        let enterName = readLine(as: String.self)
        player.name = enterName!
        player.hero = heroGenerator.getRandom()
        player.hero.weapon = equipmentGenerator.noWeapon
        player.hero.armor = equipmentGenerator.noArmor
        return player
    }
}