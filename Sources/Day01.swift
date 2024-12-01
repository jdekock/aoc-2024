import Algorithms
import Foundation

struct Day01: AdventDay {
    var data: String

    func part1() -> Any {
        var leftList: [Int] = []
        var rightList: [Int] = []
        var distances: Int = 0
        
        let _ = data
            .split(separator: "\n")
            .forEach { element in
                let nums = element.split(separator: " ")
                leftList.append(Int(nums[0]) ?? 0)
                rightList.append(Int(nums[1]) ?? 0)
            }
        
        leftList = leftList.sorted()
        rightList = rightList.sorted()
        
        leftList.enumerated().forEach { index, left in
            distances += abs(left - rightList[index])
        }
        
        return distances
    }

    func part2() -> Any {
        var leftList: [Int] = []
        var rightList: [Int] = []
        var similarities: Int = 0
        
        let _ = data
            .split(separator: "\n")
            .forEach { element in
                let nums = element.split(separator: " ")
                leftList.append(Int(nums[0]) ?? 0)
                rightList.append(Int(nums[1]) ?? 0)
            }
        
        leftList = leftList.sorted()
        rightList = rightList.sorted()
        
        leftList.enumerated().forEach { index, left in
            let amount = rightList.count(where: { $0 == left })
            similarities += left * amount
        }
        
        return similarities
    }
}
