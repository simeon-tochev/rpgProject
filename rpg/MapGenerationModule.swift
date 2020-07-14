class MapGen: MapGenerator {

  init(){}
  func generate(players:[Player]) -> Map {
    let playerNumber = players.count
    let map = SmallMapTemplate(players: players)
    for var p in players{
      var y : Int
      var x : Int
      repeat{
        y = Int.random(in: 0 ..< map.sizeY)
        x = Int.random(in: 0 ..< map.sizeX)
      } while(map.maze[y][x].type != MapTileType.empty)

      p.hero.posY = y
      p.hero.posX = x
      map.maze[p.hero.posY][p.hero.posX].type = MapTileType.occupied
    }

    for _ in 0 ..< playerNumber*2 {
      var y : Int
      var x : Int
      repeat{
        y = Int.random(in: 0 ..< map.sizeY)
        x = Int.random(in: 0 ..< map.sizeX)
      } while(map.maze[y][x].type != MapTileType.empty)

      map.maze[y][x].type = MapTileType.chest
    }
    return map
  }
}

class MapTemplate: Map {
  var players: [Player] 
  var maze: [[MapTile]] 

  var sizeX: Int
  var sizeY: Int

//  var equipmentGenerator : EquipmentGenerator?
//  var fightGenerator: FightGen?

  required init(players: [Player]){
    self.players = players
    sizeX = 0
    sizeY = 0
    maze = []
  }

  func availableMoves(player: Player) -> [PlayerMove] {
    var moves: [PlayerMove] = []
    let py = player.hero.posY
    let px = player.hero.posX 
    if(maze[py][px + 1].type == .empty || maze[py][px + 1].type == .chest || maze[py][px + 1].type == .occupied){
      moves.append(StandartPlayerMove(direction: MapMoveDirection.right))
    }
    if(maze[py][px - 1].type == .empty || maze[py][px - 1].type == .chest || maze[py][px - 1].type == .occupied){
      moves.append(StandartPlayerMove(direction: MapMoveDirection.left))
    }
    if(maze[py + 1][px].type == .empty || maze[py + 1][px].type == .chest || maze[py + 1][px].type == .occupied){
      moves.append(StandartPlayerMove(direction: MapMoveDirection.down))
    }
    if(maze[py - 1][px].type == .empty || maze[py - 1][px].type == .chest || maze[py - 1][px].type == .occupied){
      moves.append(StandartPlayerMove(direction: MapMoveDirection.up))
    }
    return moves
  }

  func move(player: Player, move: PlayerMove){
    if(player.hero.energy <= 0){
      print("Нямате достатъчно енергия")
      return
    }
    var p = player
    maze[p.hero.posY][p.hero.posX].type = MapTileType.empty
    let curX = player.hero.posX
    let curY = player.hero.posY
    switch(move.direction){
      case .up:
      p.hero.posY -= 1
      case .down:
      p.hero.posY += 1
      case .left:
      p.hero.posX -= 1
      case .right:
      p.hero.posX += 1
    }
    if(maze[p.hero.posY][p.hero.posX].type == MapTileType.chest){
      openChest(player: p)
    }
    if(maze[p.hero.posY][p.hero.posX].type == MapTileType.occupied){
      let newX = p.hero.posX
      let newY = p.hero.posY
      p.hero.posX = curX
      p.hero.posY = curY
      var other: Player?
      for i in players {
        if(i.hero.posX == newX && i.hero.posY == newY){
          other = i
        }
      }
      maze[p.hero.posY][p.hero.posX].type = MapTileType.occupied
      fightGenerator.fight(attacker: player, deffender: other!)
      return
    }
    maze[p.hero.posY][p.hero.posX].type = MapTileType.occupied
    p.hero.energy -= 1
  }

  func openChest(player: Player){
    print("Отваряте сандък..")
    let numb = Int.random(in: 0..<2)
    if(numb == 0){
      equipmentGenerator.getRandomWeapon(player: player)
    } else {
      equipmentGenerator.getRandomArmor(player: player)
    }
  }
}

class SmallMapTemplate: MapTemplate {
  
  required init(players: [Player]){
    super.init(players: players)
    maze = [
    [Tile(type: .wall), Tile(type: .wall), Tile(type: .wall), Tile(type: .wall), Tile(type: .wall), Tile(type: .wall), Tile(type: .wall), Tile(type: .wall), Tile(type: .wall)],
    [Tile(type: .wall), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty),Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .wall)],
    [Tile(type: .wall), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty),Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .wall)],
    [Tile(type: .wall), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .wall)],
    [Tile(type: .wall), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .wall)],
    [Tile(type: .wall), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .wall)],
    [Tile(type: .wall), Tile(type: .empty), Tile(type: .empty) ,Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .wall)],
    [Tile(type: .wall), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .empty), Tile(type: .wall)],
    [Tile(type: .wall), Tile(type: .wall), Tile(type: .wall),Tile(type: .wall), Tile(type: .wall), Tile(type: .wall), Tile(type: .wall), Tile(type: .wall), Tile(type: .wall)]]
    sizeX = 9
    sizeY = 9
  }
}
  
struct Tile: MapTile {
    var type: MapTileType
    var state: String

    init(type: MapTileType) {
      self.type = type
      state = " "
    }
}