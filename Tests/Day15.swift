import XCTest

@testable import AdventOfCode

final class Day15Tests: XCTestCase {
    // Smoke test data provided in the challenge question
    let testData = """
        1
        """

    func testPart1() throws {
        let challenge = Day15(data: testData)
        
        print("\n🎄 Advent of Code // day 15 // tests")
        print("Test part 1: \(challenge.part1())")
        
        XCTAssertEqual(String(describing: challenge.part1()), "1")
    }
    
    let testData2 = """
        2
        """

    func testPart2() throws {
        let challenge = Day15(data: testData2)
        print("Test part 2: \(challenge.part2())\n")
        XCTAssertEqual(String(describing: challenge.part2()), "2")
    }
}
