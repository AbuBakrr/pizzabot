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
        let distance = end - start
        let count = abs(distance)
        let instruction: Instruction = distance > 0 ? .moveEast : .moveWest
        
        return [Instruction](repeating: instruction, count: count)
    }
    
    static func generateInstructionsForYAxis(from start: Int, to end: Int) -> [Instruction] {
        let distance = end - start
        let count = abs(distance)
        let instruction: Instruction = distance > 0 ? .moveNorth : .moveSouth
        
        return [Instruction](repeating: instruction, count: count)
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
    
    func test_generationOfMovemenetsOnXAxis() {
        // Ccase #1
        let instructions1: [Instruction] = Instructor.generateInstructionsForXAxis(from: 0, to: 0)
        let expectedInstructions1: [Instruction] = []
        XCTAssertEqual(instructions1, expectedInstructions1)
        
        // Ccase #2
        let instructions2: [Instruction] = Instructor.generateInstructionsForXAxis(from: 1, to: 3)
        let expectedInstructions2: [Instruction] = [.moveEast, .moveEast]
        XCTAssertEqual(instructions2, expectedInstructions2)
        
        // Ccase #3
        let instructions3: [Instruction] = Instructor.generateInstructionsForXAxis(from: 4, to: 1)
        let expectedInstructions3: [Instruction] = [.moveWest, .moveWest, .moveWest]
        XCTAssertEqual(instructions3, expectedInstructions3)
        
        // Ccase #4
        let instructions4: [Instruction] = Instructor.generateInstructionsForXAxis(from: 2, to: 2)
        let expectedInstructions4: [Instruction] = []
        XCTAssertEqual(instructions4, expectedInstructions4)
    }
    
    func test_generationOfMovemenetsOnYAxis() {
        // Ccase #1
        let instructions1: [Instruction] = Instructor.generateInstructionsForYAxis(from: 0, to: 0)
        let expectedInstructions1: [Instruction] = []
        XCTAssertEqual(instructions1, expectedInstructions1)
        
        // Ccase #2
        let instructions2: [Instruction] = Instructor.generateInstructionsForYAxis(from: 1, to: 3)
        let expectedInstructions2: [Instruction] = [.moveNorth, .moveNorth]
        XCTAssertEqual(instructions2, expectedInstructions2)
        
        // Ccase #3
        let instructions3: [Instruction] = Instructor.generateInstructionsForYAxis(from: 4, to: 1)
        let expectedInstructions3: [Instruction] = [.moveSouth, .moveSouth, .moveSouth]
        XCTAssertEqual(instructions3, expectedInstructions3)
        
        // Ccase #4
        let instructions4: [Instruction] = Instructor.generateInstructionsForYAxis(from: 2, to: 2)
        let expectedInstructions4: [Instruction] = []
        XCTAssertEqual(instructions4, expectedInstructions4)
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
}
