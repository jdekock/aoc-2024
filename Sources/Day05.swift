import Algorithms
import Foundation

struct Day05: AdventDay {
    var data: String

    func part1() -> Any {
        var orderingAfter: [Int: [Int]] = [:]
        var orderingBefore: [Int: [Int]] = [:]
        let dataSplit = data.split(separator: "\n\n")
        var correctUpdates: Int = 0
        
        dataSplit.first?.split(separator: "\n").forEach { row in
            let nums = row.split(separator: "|").compactMap({ Int($0) })
            orderingAfter[nums.first ?? 0, default: []].append(nums.last ?? 0)
            orderingBefore[nums.last ?? 0, default: []].append(nums.first ?? 0)
        }
        
        dataSplit.last?.split(separator: "\n").forEach { row in
            var validUpdate = true
            let nums = row.split(separator: ",").compactMap({ Int($0) })
            
            nums.enumerated().forEach { (i, num) in
                let after = nums[i+1..<nums.count]
                if !after.allSatisfy((orderingAfter[num] ?? []).contains) {
                    validUpdate = false
                }
                
                let before = nums[0..<i]
                if !before.allSatisfy((orderingBefore[num] ?? []).contains) {
                    validUpdate = false
                }
            }
            
            if validUpdate {
                correctUpdates += nums[(nums.count / 2)]
            }
        }
        
        return correctUpdates
    }

    func part2() -> Any {
        var orderingAfter: [Int: [Int]] = [:]
        var orderingBefore: [Int: [Int]] = [:]
        let dataSplit = data.split(separator: "\n\n")
        var incorrectUpdates: Int = 0
        
        dataSplit.first?.split(separator: "\n").forEach { row in
            let nums = row.split(separator: "|").compactMap({ Int($0) })
            orderingAfter[nums.first ?? 0, default: []].append(nums.last ?? 0)
            orderingBefore[nums.last ?? 0, default: []].append(nums.first ?? 0)
        }
        
        dataSplit.last?.split(separator: "\n").forEach { row in
            var validUpdate = true
            let nums = row.split(separator: ",").compactMap({ Int($0) })
            
            nums.enumerated().forEach { (i, num) in
                let after = nums[i+1..<nums.count]
                if !after.allSatisfy((orderingAfter[num] ?? []).contains) {
                    validUpdate = false
                }
                
                let before = nums[0..<i]
                if !before.allSatisfy((orderingBefore[num] ?? []).contains) {
                    validUpdate = false
                }
            }
            
            if !validUpdate {
                let orderedNums = reorder(nums, orderingBefore, orderingAfter)
                incorrectUpdates += orderedNums[(orderedNums.count / 2)]
            }
        }
        
        return incorrectUpdates
    }
    
    func reorder(_ nums: [Int], _ orderingBefore: [Int: [Int]], _ orderingAfter: [Int: [Int]]) -> [Int]{
        var nums = nums
        var validOrder = false
        
        while validOrder == false {
            var validUpdate = true
            
            for (i, num) in nums.enumerated() {
                var after = nums[i+1..<nums.count]
                if !after.allSatisfy((orderingAfter[num] ?? []).contains) {
                    var matches = Set(after).intersection(orderingAfter[num] ?? [])
                    after.removeAll(where: { matches.contains($0) })

                    for moveNum in after {
                        if let numIndex = nums.firstIndex(where: { $0 == moveNum }) {
                            let element = nums.remove(at: numIndex)
                            nums.insert(element, at: nums.firstIndex(where: { $0 == num }) ?? 0)
                        }
                    }
                    
                    validUpdate = false
                    
                    break
                }
            }
            
            if validUpdate {
                validOrder = true
            }
        }

        return nums
    }
}
