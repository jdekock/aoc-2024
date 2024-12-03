import Algorithms
import Foundation

struct Day03: AdventDay {
    var data: String

    func part1() -> Any {
        let regex = try! NSRegularExpression(pattern: "mul\\(\\d{1,},\\d{1,}\\)")
        let results = regex.matches(in: data, range: NSRange(data.startIndex..., in: data))
        
        var total: Int = 0
        results.forEach { result in
            let nums = String(data[Range(result.range, in: data)!]).replacingOccurrences(of: "mul(", with: "").replacingOccurrences(of: ")", with: "").split(separator:",")
            total += (Int(nums[0]) ?? 0) * (Int(nums[1]) ?? 0)
        }
        
        return total
    }

    func part2() -> Any {
        let results = try! NSRegularExpression(pattern: "do\\(\\)|don't\\(\\)|mul\\(\\d{1,},\\d{1,}\\)").matches(in: data, range: NSRange(data.startIndex..., in: data))
        var skipping = false
        
        return results.map({ result in
            let substring = String(data[Range(result.range, in: data)!])
            
            if substring == "don't()" {
                skipping = true
            } else if substring == "do()" {
                skipping = false
            } else if skipping == false {
                let nums = substring.replacingOccurrences(of: "mul(", with: "").replacingOccurrences(of: ")", with: "").split(separator:",")
                return (Int(nums[0]) ?? 0) * (Int(nums[1]) ?? 0)
            }
            
            return 0
        }).reduce(0, +)
    }
}
