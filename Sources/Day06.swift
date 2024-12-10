import Algorithms
import Foundation

enum Direction: CaseIterable {
    case up, right, down, left
}

struct Day06: AdventDay {
    var data: String

    func part1() -> Any {
        let map = parseMap(data)
        return getPath(map, false)
    }

    func part2() -> Any {
        let map = parseMap(data)
        return getPath(map, true)
    }
    
    private func parseMap(_ data: String) -> [[Character]] {
        data.split(separator: "\n").map(Array.init)
    }
    
    private func getPath(_ map: [[Character]], _ findObstacles: Bool) -> Int {
        let (obstructions, guardPos) = findObstructionsAndGuard(in: map)
        
        if let visitedSpots = findPath(guardPos, obstructions, map) {
            if findObstacles {
                return countObstacles(guardPos: guardPos, visitedSpots: visitedSpots, obstructions: obstructions, map: map)
            } else {
                return visitedSpots.count
            }
        }
        
        return 0
    }
    
    private func findObstructionsAndGuard(in map: [[Character]]) -> ([(Int, Int)], (Int, Int)) {
        var obstructions: [(Int, Int)] = []
        var guardPos: (Int, Int) = (0, 0)
        
        for (row, rowData) in map.enumerated() {
            for (col, char) in rowData.enumerated() {
                if char == "#" {
                    obstructions.append((row, col))
                } else if char == "^" {
                    guardPos = (row, col)
                }
            }
        }
        
        return (obstructions, guardPos)
    }
    
    private func countObstacles(guardPos: (Int, Int), visitedSpots: [(Int, Int)], obstructions: [(Int, Int)], map: [[Character]]) -> Int {
        var obstacles = 0
        var tempObstructions = obstructions
        
        for spot in visitedSpots {
            tempObstructions.insert(spot, at: 0)
            if findPath(guardPos, tempObstructions, map) == nil {
                obstacles += 1
            }
            tempObstructions.remove(at: 0)
        }
        
        return obstacles
    }
    
    private func findPath(_ startPos: (Int, Int), _ obstructions: [(Int, Int)], _ map: [[Character]]) -> [(Int, Int)]? {
        var guardPos = startPos
        var visitedSpots: [(Int, Int)] = []
        var hits: [(Int, Int, Direction)] = []
        var direction: Direction = .up
        
        while isValidPosition(guardPos, in: map) {
            if let nextPos = move(from: guardPos, in: direction, obstructions: obstructions) {
                guardPos = nextPos
                if !visitedSpots.contains(where: { $0 == guardPos }) { visitedSpots.append(guardPos) }
            } else {
                let hit = (guardPos.0, guardPos.1, direction)
                if hits.contains(where: { $0 == hit }) {
                    return nil
                }
                
                hits.append(hit)
                direction = direction.next()
            }
        }
        
        return visitedSpots
    }
    
    private func isValidPosition(_ pos: (Int, Int), in map: [[Character]]) -> Bool {
        pos.0 >= 0 && pos.0 < map.count && pos.1 >= 0 && pos.1 < map[0].count
    }
    
    private func move(from pos: (Int, Int), in direction: Direction, obstructions: [(Int, Int)]) -> (Int, Int)? {
        let newPos: (Int, Int)
        switch direction {
        case .up: newPos = (pos.0 - 1, pos.1)
        case .right: newPos = (pos.0, pos.1 + 1)
        case .down: newPos = (pos.0 + 1, pos.1)
        case .left: newPos = (pos.0, pos.1 - 1)
        }
        
        return obstructions.contains(where: { $0 == newPos }) ? nil : newPos
    }
}

extension Direction {
    func next() -> Direction {
        let allCases = Direction.allCases
        let nextIndex = (allCases.firstIndex(of: self)! + 1) % allCases.count
        return allCases[nextIndex]
    }
}
