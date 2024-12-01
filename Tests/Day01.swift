import XCTest

@testable import AdventOfCode

final class Day01Tests: XCTestCase {
    // Smoke test data provided in the challenge question
    let testData = """
        3   4
        4   3
        2   5
        1   3
        3   9
        3   3
        """

    func testPart1() throws {
        let challenge = Day01(data: testData)
        XCTAssertEqual(String(describing: challenge.part1()), "11")
    }
    
    let testData2 = """
        3   4
        4   3
        2   5
        1   3
        3   9
        3   3
        """

    func testPart2() throws {
        let challenge = Day01(data: testData2)
        XCTAssertEqual(String(describing: challenge.part2()), "31")
    }
}
