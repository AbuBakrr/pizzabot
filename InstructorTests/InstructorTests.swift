//
//  InstructorTests.swift
//  InstructorTests
//
//  Created by Abu-Bakr Jabbarov on 12/21/21.
//

import XCTest
import Instructor

final class Instructor {
    
    // MARK: - Properties
    
//    let locations: [Location]
//    let map: Map
    
    // MARK: - Init
//    init(map: Map, locations: [Location]) {
////        self.map = map
//        
//    }
    
    static func generateInstructionsToMove(from start: Location, to end: Location) -> [Instruction] {
        return generateInstructionsToMoveOverXAxis(from: start.x, to: end.x) + generateInstructionsToMoveOverYAxis(from: start.y, to: end.y)
    }
    
    static func generateInstructionsToMoveOverXAxis(from start: Int, to end: Int) -> [Instruction] {
        let distance = end - start
        let count = abs(distance)
        let instruction: Instruction = distance > 0 ? .moveEast : .moveWest
        
        return [Instruction](repeating: instruction, count: count)
    }
    
    static func generateInstructionsToMoveOverYAxis(from start: Int, to end: Int) -> [Instruction] {
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
        let instructions1: [Instruction] = Instructor.generateInstructionsToMoveOverXAxis(from: 0, to: 0)
        let expectedInstructions1: [Instruction] = []
        XCTAssertEqual(instructions1, expectedInstructions1)
        
        // Ccase #2
        let instructions2: [Instruction] = Instructor.generateInstructionsToMoveOverXAxis(from: 1, to: 3)
        let expectedInstructions2: [Instruction] = [.moveEast, .moveEast]
        XCTAssertEqual(instructions2, expectedInstructions2)
        
        // Ccase #3
        let instructions3: [Instruction] = Instructor.generateInstructionsToMoveOverXAxis(from: 4, to: 1)
        let expectedInstructions3: [Instruction] = [.moveWest, .moveWest, .moveWest]
        XCTAssertEqual(instructions3, expectedInstructions3)
        
        // Ccase #4
        let instructions4: [Instruction] = Instructor.generateInstructionsToMoveOverXAxis(from: 2, to: 2)
        let expectedInstructions4: [Instruction] = []
        XCTAssertEqual(instructions4, expectedInstructions4)
    }
    
    func test_generationOfMovemenetsOnYAxis() {
        // Ccase #1
        let instructions1: [Instruction] = Instructor.generateInstructionsToMoveOverYAxis(from: 0, to: 0)
        let expectedInstructions1: [Instruction] = []
        XCTAssertEqual(instructions1, expectedInstructions1)
        
        // Ccase #2
        let instructions2: [Instruction] = Instructor.generateInstructionsToMoveOverYAxis(from: 1, to: 3)
        let expectedInstructions2: [Instruction] = [.moveNorth, .moveNorth]
        XCTAssertEqual(instructions2, expectedInstructions2)
        
        // Ccase #3
        let instructions3: [Instruction] = Instructor.generateInstructionsToMoveOverYAxis(from: 4, to: 1)
        let expectedInstructions3: [Instruction] = [.moveSouth, .moveSouth, .moveSouth]
        XCTAssertEqual(instructions3, expectedInstructions3)
        
        // Ccase #4
        let instructions4: [Instruction] = Instructor.generateInstructionsToMoveOverYAxis(from: 2, to: 2)
        let expectedInstructions4: [Instruction] = []
        XCTAssertEqual(instructions4, expectedInstructions4)
    }
    
    func test_generationOfMovements() {
        // Case #1
        let start1 = Location(x: 0, y: 0)
        let end1 = Location(x: 0, y: 0)
        let instructions1 = Instructor.generateInstructionsToMove(from: start1, to: end1)
        let expectedInstructions1: [Instruction] = []
        XCTAssertEqual(instructions1, expectedInstructions1)
        
        // Case #2
        let start2 = Location(x: 0, y: 0)
        let end2 = Location(x: 1, y: 3)
        let instructions2 = Instructor.generateInstructionsToMove(from: start2, to: end2)
        let expectedInstructions2: [Instruction] = [.moveEast, .moveNorth, .moveNorth, .moveNorth]
        XCTAssertEqual(instructions2, expectedInstructions2)
        
        // Case #3
        let start3 = Location(x: 1, y: 3)
        let end3 = Location(x: 4, y: 4)
        let instructions3 = Instructor.generateInstructionsToMove(from: start3, to: end3)
        let expectedInstructions3: [Instruction] = [.moveEast, .moveEast, .moveEast, .moveNorth]
        XCTAssertEqual(instructions3, expectedInstructions3)
        
        // Case #4
        let start4 = Location(x: 4, y: 2)
        let end4 = Location(x: 0, y: 0)
        let instructions4 = Instructor.generateInstructionsToMove(from: start4, to: end4)
        let expectedInstructions4: [Instruction] = [.moveWest, .moveWest, .moveWest, .moveWest, .moveSouth, .moveSouth]
        XCTAssertEqual(instructions4, expectedInstructions4)
        
        // Case #5
        let start5 = Location(x: 1, y: 1)
        let end5 = Location(x: 2, y: 1)
        let instructions5 = Instructor.generateInstructionsToMove(from: start5, to: end5)
        let expectedInstructions5: [Instruction] = [.moveEast]
        XCTAssertEqual(instructions5, expectedInstructions5)
    }
}
