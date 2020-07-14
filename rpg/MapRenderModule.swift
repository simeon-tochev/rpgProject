class MapRender: MapRenderer {
    func render(map: Map) {
        for row in map.maze {
            self.renderMapRow(row: row)
        }
        
        renderMapLegend()
    }
    
    private func renderMapRow(row: [MapTile]) {
        var r = ""
        for tile in row {
            switch tile.type {
            case .chest:
                r += "📦 "
            case .empty:
                r += "  "
            case .wall:
                r += "■ "
            case .occupied:
                r += "🙂 "
            default:
                r += "  "
            }
        }
        
        print("\(r)")
    }
    
    private func renderMapLegend() {
        print("Легенда: ")
        print(" 📦  - Сандък")
        print(" 🙂  - Играч")
        print(" ■ - Стена")
        
    }
}