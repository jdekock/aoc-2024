import XCTest

@testable import AdventOfCode

final class Day12Tests: XCTestCase {
    // Smoke test data provided in the challenge question
    let testData = """
        1
        """

    func testPart1() throws {
        let challenge = Day12(data: testData)
        
        print("\n🎄 Advent of Code // day 12 // tests")
        print("Test part 1: \(challenge.part1())")
        
        XCTAssertEqual(String(describing: challenge.part1()), "1")
    }
    
    let testData2 = """
        2
        """

    func testPart2() throws {
        let challenge = Day12(data: testData2)
        print("Test part 2: \(challenge.part2())\n")
        XCTAssertEqual(String(describing: challenge.part2()), "2")
    }
}
