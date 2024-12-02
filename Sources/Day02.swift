import Algorithms
import Foundation

struct Day02: AdventDay {
    var data: String

    func part1() -> Any {
        var safeCount = 0
        let reports: [[Int]] = data.split(separator: "\n").map({ $0.split(separator: " ").map({ Int($0) ?? 0 }) })
        
        reports.forEach { report in
            if checkReport(report) {
                safeCount += 1
            }
        }
        
        return safeCount
    }

    func part2() -> Any {
        var safeCount = 0
        let reports: [[Int]] = data.split(separator: "\n").map({ $0.split(separator: " ").map({ Int($0) ?? 0 }) })
        
        reports.forEach { report in
            if checkReport(report) {
                safeCount += 1
            } else {
                for index in 0..<report.count {
                    var newreport = report
                    newreport.remove(at: index)
                    
                    if checkReport(newreport) {
                        safeCount += 1
                        break
                    }
                }
            }
        }
        
        return safeCount
    }
    
    func checkReport(_ report: [Int]) -> Bool {
        if report.sorted() == report || report.sorted() == report.reversed() {
            let result = zip(report, report.dropFirst(1)).map { abs($0 - $1) }.sorted()
            if result.last ?? 0 > 3 {
                return false
            } else if result.first == 0 {
                return false
            }
        } else {
            return false
        }
        
        return true
    }
}
