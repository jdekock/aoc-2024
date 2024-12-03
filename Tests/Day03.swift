import XCTest

@testable import AdventOfCode

final class Day03Tests: XCTestCase {
    // Smoke test data provided in the challenge question
    let testData = """
        xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
        """

    func testPart1() throws {
        let challenge = Day03(data: testData)
        
        print("\n🎄 Advent of Code // day 3 // tests")
        print("Test part 1: \(challenge.part1())")
        
        XCTAssertEqual(String(describing: challenge.part1()), "161")
    }
    
    let testData2 = """
        xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
        """

    func testPart2() throws {
        let challenge = Day03(data: testData2)
        
        print("Test part 2: \(challenge.part2())\n")
        
        XCTAssertEqual(String(describing: challenge.part2()), "48")
    }
}
