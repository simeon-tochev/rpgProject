class ArmorTemplate : Armor {
  
  init(name: String, defence: Int, attack: Int){
    self.name = name
    self.attack = attack
    self.defence = defence
  }

  var name: String
  var attack: Int
  var defence: Int
}

class WeaponTemplate : Weapon {
  
  init(name: String, defence: Int, attack: Int){
    self.name = name
    self.attack = attack
    self.defence = defence
  }

  var name: String
  var attack: Int
  var defence: Int
}

class EquipmentGen: EquipmentGenerator {
  var noArmor = ArmorTemplate(name: "No Armor", defence: 0, attack: 0)
  var noWeapon = WeaponTemplate(name: "No Weapon", defence: 0, attack: 1)

  var allArmors: [Armor] = [
    ArmorTemplate(name: "Leather Armor", defence: 1, attack: 0),
    ArmorTemplate(name: "Golden Armor", defence: 3, attack: 0),
    ArmorTemplate(name: "Chainmail Armor", defence: 2, attack: 1),
    ArmorTemplate(name: "Enchanted Armor", defence: 4, attack: 2),
    ArmorTemplate(name: "Obsidian Armor", defence: 6, attack: 0),
  ]
  var allWeapons: [Weapon] = [
    WeaponTemplate(name: "Knife", defence: 0, attack: 1),
    WeaponTemplate(name: "Bow", defence: 0, attack: 2),
    WeaponTemplate(name: "Iron Sword", defence: 1, attack: 3),
    WeaponTemplate(name: "Battle Axe", defence: 3, attack: 4),
    WeaponTemplate(name: "Enchanted Sword", defence: 1, attack: 7),
  ]

  func getRandomWeapon(player: Player){
    let number = Int.random(in: 0 ..< allWeapons.count)
    let weapon = allWeapons[number]
    print("Вие октрихте оръжие - Attack: \(weapon.attack) Defence: \(weapon.defence). Желаете ли да го замените с вашето оръжие -  Attack: \(player.hero.weapon!.attack) Defence: \(player.hero.weapon!.defence) (yes/no)")

    let command = readLine(as: String.self)
    if(command == "yes"){
      var p = player
      p.hero.weapon = weapon
    }
  }
  

  func getRandomArmor(player: Player){
    let number = Int.random(in: 0 ..< allWeapons.count)
    let armor = allArmors[number]
    print("Вие октрихте броня - Attack: \(armor.attack) Defence: \(armor.defence). Желаете ли да я замените с вашата броня -  Attack: \(player.hero.armor!.attack) Defence: \(player.hero.armor!.defence) (yes/no)")

    let command = readLine(as: String.self)
    if(command == "yes"){
      var p = player
      p.hero.armor = armor
    }
  }
  

}