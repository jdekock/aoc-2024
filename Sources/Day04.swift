import Algorithms
import Foundation

struct Day04: AdventDay {
    var data: String

    func part1() -> Any {
        let map: [[Character]] = data.split(separator: "\n").map({ Array($0) })
        var xPos: [(Int, Int)] = []
        var xmasCount = 0
        
        map.enumerated().forEach { row, rowData in
            rowData.enumerated().forEach { col, char in
                if char == "X" {
                    xPos.append((row, col))
                }
            }
        }
        
        for (x, y) in xPos {
            // Left to right
            if x < (map.first?.count ?? 0) - 3, map[x + 1][y] == "M" {
                if map[x + 2][y] == "A", map[x + 3][y] == "S" {
                    xmasCount += 1
                }
            }
            
            // Right to left
            if x >= 3, map[x - 1][y] == "M" {
                if map[x - 2][y] == "A", map[x - 3][y] == "S" {
                    xmasCount += 1
                }
            }
            
            // Top to bottom
            if y < map.count - 3, map[x][y + 1] == "M" {
                if map[x][y + 2] == "A", map[x][y + 3] == "S" {
                    xmasCount += 1
                }
            }
            
            // Bottom to top
            if y >= 3, map[x][y - 1] == "M" {
                if map[x][y - 2] == "A", map[x][y - 3] == "S" {
                    xmasCount += 1
                }
            }
            
            // Top left
            if x >= 3, y >= 3, map[x - 1][y - 1] == "M" {
                if map[x - 2][y - 2] == "A", map[x - 3][y - 3] == "S" {
                    xmasCount += 1
                }
            }
            
            // Top right
            if x < (map.first?.count ?? 0) - 3, y >= 3, map[x + 1][y - 1] == "M" {
                if map[x + 2][y - 2] == "A", map[x + 3][y - 3] == "S" {
                    xmasCount += 1
                }
            }
            
            // Bottom left
            if x >= 3, y < map.count - 3, map[x - 1][y + 1] == "M" {
                if map[x - 2][y + 2] == "A", map[x - 3][y + 3] == "S" {
                    xmasCount += 1
                }
            }
            
            // Bottom right
            if x < (map.first?.count ?? 0) - 3, y < map.count - 3, map[x + 1][y + 1] == "M" {
                if map[x + 2][y + 2] == "A", map[x + 3][y + 3] == "S" {
                    xmasCount += 1
                }
            }
        }
        
        return xmasCount
    }

    func part2() -> Any {
        let map: [[Character]] = data.split(separator: "\n").map({ Array($0) })
        var aPos: [(Int, Int)] = []
        var xmasCount = 0
        
        map.enumerated().forEach { row, rowData in
            rowData.enumerated().forEach { col, char in
                if char == "A" {
                    aPos.append((row, col))
                }
            }
        }
        
        for (x, y) in aPos {
            if x >= 1, y >= 1, x < map.count - 1, y < (map.first?.count ?? 0) - 1 {
                if map[x - 1][y - 1] == "S", map[x + 1][y + 1] == "M" {
                    if map[x + 1][y - 1] == "S", map[x - 1][y + 1] == "M" {
                        xmasCount += 1
                    } else if map[x + 1][y - 1] == "M", map[x - 1][y + 1] == "S" {
                        xmasCount += 1
                    }
                } else if map[x - 1][y - 1] == "M", map[x + 1][y + 1] == "S" {
                    if map[x + 1][y - 1] == "S", map[x - 1][y + 1] == "M" {
                        xmasCount += 1
                    } else if map[x + 1][y - 1] == "M", map[x - 1][y + 1] == "S" {
                        xmasCount += 1
                    }
                }
            }
        }
        
        return xmasCount
    }
}
