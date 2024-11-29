import XCTest

@testable import AdventOfCode

final class Day12Tests: XCTestCase {
    // Smoke test data provided in the challenge question
    let testData = """
        1
        """

    func testPart1() throws {
        let challenge = Day01(data: testData)
        XCTAssertEqual(String(describing: challenge.part1()), "1")
    }
    
    let testData2 = """
        2
        """

    func testPart2() throws {
        let challenge = Day01(data: testData2)
        XCTAssertEqual(String(describing: challenge.part2()), "2")
    }
}
