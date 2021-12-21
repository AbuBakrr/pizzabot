//
//  InstructorTests.swift
//  InstructorTests
//
//  Created by Abu-Bakr Jabbarov on 12/21/21.
//

import XCTest
import Instructor

final class Instructor {
    
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
}
