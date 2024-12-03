import Algorithms
import Foundation

struct Day03: AdventDay {
    var data: String

    func part1() -> Any {
        let regexmul = try! NSRegularExpression(pattern: "mul\\(\\d{1,},\\d{1,}\\)")
        
        let results = regexmul.matches(in: data, range: NSRange(data.startIndex..., in: data))
        
        var total: Int = 0
        results.forEach { result in
            let nums = String(data[Range(result.range, in: data)!]).replacingOccurrences(of: "mul(", with: "").replacingOccurrences(of: ")", with: "").split(separator:",")
            total += (Int(nums[0]) ?? 0) * (Int(nums[1]) ?? 0)
        }
        
        return total
    }

    func part2() -> Any {
        let regexmul = try! NSRegularExpression(pattern: "mul\\(\\d{1,},\\d{1,}\\)")
        let regexdo = try! NSRegularExpression(pattern: "do()")
        let regexdont = try! NSRegularExpression(pattern: "don't()")
        
        let results = regexmul.matches(in: data, range: NSRange(data.startIndex..., in: data))
        let dos = regexdo.matches(in: data, range: NSRange(data.startIndex..., in: data))
        let donts = regexdont.matches(in: data, range: NSRange(data.startIndex..., in: data))
        
        var all: [NSTextCheckingResult] = []
        all.append(contentsOf: results)
        all.append(contentsOf: dos)
        all.append(contentsOf: donts)
        all = all.sorted(by: { $0.range.location < $1.range.location })
        
        var total: Int = 0
        var skipping = false
        
        all.forEach { result in
            if result.regularExpression == regexdont {
                skipping = true
            } else if result.regularExpression == regexdo {
                skipping = false
            } else if skipping == false {
                let nums = String(data[Range(result.range, in: data)!]).replacingOccurrences(of: "mul(", with: "").replacingOccurrences(of: ")", with: "").split(separator:",")
                total += (Int(nums[0]) ?? 0) * (Int(nums[1]) ?? 0)
            }
        }

        return total
    }
}
