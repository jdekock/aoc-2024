import Algorithms
import Foundation

struct Day05: AdventDay {
    var data: String
    
    func part1() -> Any {
        let dataSplit = data.split(separator: "\n\n")
        var orderingAfter: [Int: [Int]] = [:]
        var orderingBefore: [Int: [Int]] = [:]
        
        (orderingAfter, orderingBefore) = createOrderMap(dataSplit.first)
        
        var correctUpdates: Int = 0
        
        dataSplit.last?.split(separator: "\n").forEach { row in
            let nums = row.split(separator: ",").compactMap({ Int($0) })
            if validateOrder(nums, orderingAfter, orderingBefore) {
                correctUpdates += nums[(nums.count / 2)]
            }
        }
        
        return correctUpdates
    }

    func part2() -> Any {
        let dataSplit = data.split(separator: "\n\n")
        var orderingAfter: [Int: [Int]] = [:]
        var orderingBefore: [Int: [Int]] = [:]
        
        (orderingAfter, orderingBefore) = createOrderMap(dataSplit.first)
        
        var incorrectUpdates: Int = 0
        dataSplit.last?.split(separator: "\n").forEach { row in
            var nums = row.split(separator: ",").compactMap({ Int($0) })
            if !validateOrder(nums, orderingAfter, orderingBefore) {
                while validateOrder(nums, orderingAfter, orderingBefore) == false {
                    nums = reorder(nums, orderingAfter)
                }
                
                incorrectUpdates += nums[(nums.count / 2)]
            }
        }
        
        return incorrectUpdates
    }
    
    func createOrderMap(_ dataSplit: String.SubSequence?) -> ([Int: [Int]], [Int: [Int]]) {
        var orderingAfter: [Int: [Int]] = [:]
        var orderingBefore: [Int: [Int]] = [:]
        
        guard let dataSplit else { return (orderingAfter, orderingBefore) }
        
        dataSplit.split(separator: "\n").forEach { row in
            let nums = row.split(separator: "|").compactMap({ Int($0) })
            orderingAfter[nums.first ?? 0, default: []].append(nums.last ?? 0)
            orderingBefore[nums.last ?? 0, default: []].append(nums.first ?? 0)
        }
        
        return (orderingAfter, orderingBefore)
    }
    
    func validateOrder(_ nums: [Int], _ orderingAfter: [Int: [Int]], _ orderingBefore: [Int: [Int]]) -> Bool {
        var validOrder = true
        
        nums.enumerated().forEach { (i, num) in
            let after = nums[i+1..<nums.count]
            if !after.allSatisfy((orderingAfter[num] ?? []).contains) {
                validOrder = false
            }
            
            let before = nums[0..<i]
            if !before.allSatisfy((orderingBefore[num] ?? []).contains) {
                validOrder = false
            }
        }
        
        return validOrder
    }
    
    func reorder(_ nums: [Int], _ orderingAfter: [Int: [Int]]) -> [Int]{
        var nums = nums
        for (i, num) in nums.enumerated() {
            var after = nums[i+1..<nums.count]
            if !after.allSatisfy((orderingAfter[num] ?? []).contains) {
                let matches = Set(after).intersection(orderingAfter[num] ?? [])
                after.removeAll(where: { matches.contains($0) })

                for moveNum in after {
                    if let numIndex = nums.firstIndex(where: { $0 == moveNum }) {
                        let element = nums.remove(at: numIndex)
                        nums.insert(element, at: nums.firstIndex(where: { $0 == num }) ?? 0)
                    }
                }
                
                break
            }
        }

        return nums
    }
}
