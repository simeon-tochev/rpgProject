var equipmentGenerator = EquipmentGen()
var playerGenerator = PlayerGen(heroGenerator: HeroGen())
var mapGenerator = MapGen()
var fightGenerator = FightGen()
var mapRenderer = MapRender()

var game = Game(mapGenerator: mapGenerator, playerGenerator: playerGenerator, mapRenderer: mapRenderer)
game.run()

