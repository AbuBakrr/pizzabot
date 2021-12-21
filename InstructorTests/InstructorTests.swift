//
//  InstructorTests.swift
//  InstructorTests
//
//  Created by Abu-Bakr Jabbarov on 12/21/21.
//

import XCTest
import Instructor

final class Instructor {
    
    func measureDistance(from firstLocation: Location, to secondLocation: Location) -> Int {
        return abs(firstLocation.x - secondLocation.x) + abs(firstLocation.y - secondLocation.y)
    }
}

class InstructorTests: XCTestCase {

    var sut: Instructor!
    
    override func setUp() {
        super.setUp()
        sut = Instructor()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_calculatesCorrectDistances() {
        // Given
        let locationA = Location(x: 1, y: 3)
        let locationB = Location(x: 4, y: 1)
        
        // Then
        let distance = sut.measureDistance(from: locationA, to: locationB)
        XCTAssertEqual(distance, 5)
    }

}
