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
        let routes = makeRouteItems()
        
        // Then
        for route in routes {
            let distance = DistanceCalculator.measureDistance(from: route.start, to: route.end)
            XCTAssertEqual(distance, route.distance)
        }
    }

    // MARK: - Helpers
    
    struct Route {
        let start: Location
        let end: Location
        let distance: Int
    }
    
    private func makeRouteItems() -> [Route] {
        return [
            Route(start: Location(x: 0, y: 0), end: Location(x: 0, y: 0), distance: 0),
            Route(start: Location(x: 0, y: 0), end: Location(x: 1, y: 3), distance: 4),
            Route(start: Location(x: 1, y: 3), end: Location(x: 0, y: 0), distance: 4),
            Route(start: Location(x: 1, y: 4), end: Location(x: 1, y: 1), distance: 3),
            Route(start: Location(x: 4, y: 2), end: Location(x: 2, y: 3), distance: 3),
        ]
    }
}

