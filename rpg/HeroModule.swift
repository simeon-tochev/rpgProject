
class Human : Hero {
    var posX: Int = 0
    var posY: Int = 0

    var race: String  = "Human"

    var energy: Int = 7
    var lifePoitns: Int = 7

    var weapon: Weapon?  = nil
    var armor: Armor? = nil
}

class Elf : Hero {
    var posX: Int = 0
    var posY: Int = 0

    var race: String  = "Elf"

    var energy: Int = 9
    var lifePoitns: Int = 5

    var weapon: Weapon?  = nil
    var armor: Armor? = nil
}

class Orc : Hero {
    var posX: Int = 0
    var posY: Int = 0

    var race: String  = "Orc"

    var energy: Int = 6
    var lifePoitns: Int = 8

    var weapon: Weapon?  = nil
    var armor: Armor? = nil
}

class HeroGen: HeroGenerator {
  func getRandom() -> Hero{
    print("Въведете раса на герой (Human, Elf, Orc): ")
    let race = readLine(as: String.self)
    let generatedHero: Hero
    switch race{
      case "Human":
      generatedHero = Human()
      case "Elf":
      generatedHero = Elf()
      case "Orc":
      generatedHero = Orc()
      default:
      generatedHero = Human()
    }
    return generatedHero
  }
}


