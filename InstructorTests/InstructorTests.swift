//
//  InstructorTests.swift
//  InstructorTests
//
//  Created by Abu-Bakr Jabbarov on 12/21/21.
//

import XCTest
import Instructor

final class Instructor {
    
    static func generateInstructions(from start: Location, to end: Location) -> [Instruction] {
        return []
    }
    
    static func generateInstructionsForXAxis(from start: Int, to end: Int) -> [Instruction] {
        let distance = start - end
        let count = abs(distance)
        let instruction: Instruction = distance > 0 ? .moveEast : .moveWest
        
        return [Instruction](repeating: .moveEast, count: count)
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
    
    func test_generationOfMovements() {
        // Given
        let start = Location(x: 1, y: 3)
        let end = Location(x: 4, y: 4)
        
        // then
        let instructions = Instructor.generateInstructions(from: start, to: end)
        let correctInstructions: [Instruction] = [.moveEast, .moveEast, .moveEast, .moveNorth]
//        XCTAssertEqual(instructions, correctInstructions)
    }
    
    func test_generationOfMovemenetsOnXAxis() {
        // Given
        let start = 2
        let end = 4
        
        let instructions = Instructor.generateInstructionsForXAxis(from: start, to: end)
        let correctInstructions: [Instruction] = [.moveEast, .moveEast]
        
        XCTAssertEqual(instructions, correctInstructions)
    }
}
