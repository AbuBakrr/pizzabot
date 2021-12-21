//
//  DistanceCalculatorTests.swift
//  InstructorTests
//
//  Created by Abu-Bakr Jabbarov on 12/21/21.
//

import XCTest
import Instructor

final class DistanceCalculator {
    
    static func measureDistance(from start: Location, to end: Location) -> Int {
        return abs(start.x - end.x) + abs(start.y - end.y)
    }
}

class DistanceCalculatorTests: XCTestCase {

    func test_calculatesCorrectDistances() {
        // Case 1
        let distance1 = DistanceCalculator.measureDistance(from: Location(x: 0, y: 0), to: Location(x: 0, y: 0))
        XCTAssertEqual(distance1, 0)
        
        // Case 2
        let distance2 = DistanceCalculator.measureDistance(from: Location(x: 0, y: 0), to: Location(x: 1, y: 3))
        XCTAssertEqual(distance2, 4)
        
        // Case 3
        let distance3 = DistanceCalculator.measureDistance(from: Location(x: 3, y: 3), to: Location(x: 5, y: 1))
        XCTAssertEqual(distance3, 4)
        
        // Case 4
        let distance4 = DistanceCalculator.measureDistance(from: Location(x: 1, y: 4), to: Location(x: 1, y: 1))
        XCTAssertEqual(distance4, 3)
                       
        // Case 5
        let distance5 = DistanceCalculator.measureDistance(from: Location(x: 4, y: 2), to: Location(x: 2, y: 3))
        XCTAssertEqual(distance5, 3)
    }
}

