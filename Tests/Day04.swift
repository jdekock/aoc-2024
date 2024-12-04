import XCTest

@testable import AdventOfCode

final class Day04Tests: XCTestCase {
    // Smoke test data provided in the challenge question
    let testData = """
        MMMSXXMASM
        MSAMXMSMSA
        AMXSXMAAMM
        MSAMASMSMX
        XMASAMXAMM
        XXAMMXXAMA
        SMSMSASXSS
        SAXAMASAAA
        MAMMMXMMMM
        MXMXAXMASX
        """

    func testPart1() throws {
        let challenge = Day04(data: testData)
        
        print("\n🎄 Advent of Code // day 4 // tests")
        print("Test part 1: \(challenge.part1())")
        
        XCTAssertEqual(String(describing: challenge.part1()), "18")
    }
    
    let testData2 = """
        MMMSXXMASM
        MSAMXMSMSA
        AMXSXMAAMM
        MSAMASMSMX
        XMASAMXAMM
        XXAMMXXAMA
        SMSMSASXSS
        SAXAMASAAA
        MAMMMXMMMM
        MXMXAXMASX
        """

    func testPart2() throws {
        let challenge = Day04(data: testData2)
        
        print("Test part 2: \(challenge.part2())\n")
        
        XCTAssertEqual(String(describing: challenge.part2()), "9")
    }
}
