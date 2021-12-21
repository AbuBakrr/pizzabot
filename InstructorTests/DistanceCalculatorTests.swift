//
//  DistanceCalculatorTests.swift
//  InstructorTests
//
//  Created by Abu-Bakr Jabbarov on 12/21/21.
//

import XCTest
import Instructor

final class DistanceCalculator {
    
    static func measureDistance(from firstLocation: Location, to secondLocation: Location) -> Int {
        return abs(firstLocation.x - secondLocation.x) + abs(firstLocation.y - secondLocation.y)
    }
}

class DistanceCalculatorTests: XCTestCase {

    func test_calculatesCorrectDistances() {
        // Given
        let locationA = Location(x: 1, y: 3)
        let locationB = Location(x: 4, y: 1)
        
        // Then
        let distance = DistanceCalculator.measureDistance(from: locationA, to: locationB)
        XCTAssertEqual(distance, 5)
    }

}
