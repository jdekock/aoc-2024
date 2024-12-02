import XCTest

@testable import AdventOfCode

final class Day20Tests: XCTestCase {
    // Smoke test data provided in the challenge question
    let testData = """
        1
        """

    func testPart1() throws {
        let challenge = Day20(data: testData)
        
        print("\n🎄 Advent of Code // day 20 // tests")
        print("Test part 1: \(challenge.part1())")
        
        XCTAssertEqual(String(describing: challenge.part1()), "1")
    }
    
    let testData2 = """
        2
        """

    func testPart2() throws {
        let challenge = Day20(data: testData2)
        print("Test part 2: \(challenge.part2())\n")
        XCTAssertEqual(String(describing: challenge.part2()), "2")
    }
}
