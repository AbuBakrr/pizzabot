//
//  MapTests.swift
//  InstructorTests
//
//  Created by Abu-Bakr Jabbarov on 12/22/21.
//

import XCTest
import Instructor

class MapTests: XCTestCase {

    var sut: Map!
    
    override func setUp() {
        super.setUp()
        sut = Map(width: 5, height: 5)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_locationInclusion() {
        // Case 1
        let location1 = Location(x: 0, y: 0)
        XCTAssertEqual(sut.includes(location: location1), true)
        
        // Case 2
        let location2 = Location(x: 6, y: 5)
        XCTAssertEqual(sut.includes(location: location2), false)
        
        // Case 3
        let location3 = Location(x: 5, y: 5)
        XCTAssertEqual(sut.includes(location: location3), true)
        
        // Case 4
        let location4 = Location(x: -1, y: 4)
        XCTAssertEqual(sut.includes(location: location4), false)
    }
}

