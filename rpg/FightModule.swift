class FightGen : FightGenerator {
  func fight(attacker: Player, deffender: Player){
    if(deffender.isAlive == false){
      print("Този играч не е жив")
    }

    let attackerAttack = attacker.hero.weapon!.attack + attacker.hero.armor!.attack
    
    let deffenderDefence = deffender.hero.weapon!.defence + deffender.hero.armor!.defence

    var damage = attackerAttack - deffenderDefence
    if(damage < 0){
      damage = 0
    }

    print("Вие нападнахте играч \(deffender.name)! Attack - \(attackerAttack) vs Defence - \(deffenderDefence). Damage - \(damage)")

    var d = deffender
    d.hero.lifePoitns -= damage
    if(deffender.hero.lifePoitns <= 0){
      d.isAlive = false
      print("Вие убихте играч \(deffender.name)")
    }


    let deffenderAttack = deffender.hero.weapon!.attack + deffender.hero.armor!.attack
    
    let attackerDefence = attacker.hero.weapon!.defence + attacker.hero.armor!.defence

    var energyDrain = deffenderAttack - attackerDefence + 1
    if(energyDrain < 1){
      energyDrain = 1
    }
    
    var a = attacker
    a.hero.energy -= energyDrain

  }
}