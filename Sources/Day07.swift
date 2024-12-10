import Algorithms
import Foundation

struct Day07: AdventDay {
    var data: String

    func part1() -> Any {
        let rows = data.split(separator: "\n").compactMap({ String($0) })
        return searchResult(rows, canConcenate: false)
    }

    func part2() -> Any {
        let rows = data.split(separator: "\n").compactMap({ String($0) })
        return searchResult(rows, canConcenate: true)
    }
    
    func searchResult(_ rows: [String], canConcenate: Bool) -> Int {
        var totalResult = 0
        rows.forEach { row in
            var found = false
            let result: Int = row.split(separator: ":").compactMap({ Int($0) }).first ?? 0
            let input: [Int] = row.split(separator: ":").last!.split(separator: " ").compactMap({ Int($0) })
            
            if input.reduce(0, +) == result {
                totalResult += result
                found = true
            }

            if input.reduce(1, *) == result, found == false {
                totalResult += result
                found = true
            }
            
            if !found {
                var possibilities: [Int] = []
                input.forEach { number in
                    if possibilities.isEmpty {
                        possibilities.append(number)
                    } else {
                        let options = possibilities
                        possibilities.removeAll()
                        
                        options.forEach { possibility in
                            possibilities.append(possibility + number)
                            possibilities.append(possibility * number)
                            
                            if canConcenate {
                                possibilities.append(Int(String("\(possibility)\(number)")) ?? 0)
                            }
                        }
                    }
                }
                
                if possibilities.contains(result) {
                    totalResult += result
                }
            }
        }
        
        return totalResult
    }
}
