//
//  InstructorTests.swift
//  InstructorTests
//
//  Created by Abu-Bakr Jabbarov on 12/21/21.
//

import XCTest
import Instructor

class InstructorTests: XCTestCase {
    
    func test_setLocationsFiltersOutNonIncludedPoints() {
        // Given
        let sut = makeSUT()
        let locations: [Location] = [
            Location(x: 6, y: 6),
            Location(x: 1, y: 2),
            Location(x: -1, y: 2)
        ]
        
        // When
        sut.set(locations: locations)
        
        // Then
        XCTAssertEqual(sut.locations, [Location(x: 1, y: 2)])
    }
    
    func test_generationOfMovemenetsOnXAxis() {
        // Case #1
        let instructions1: [Instruction] = Instructor.generateInstructionsToMoveOverXAxis(from: 0, to: 0)
        let expectedInstructions1: [Instruction] = []
        XCTAssertEqual(instructions1, expectedInstructions1)
        
        // Case #2
        let instructions2: [Instruction] = Instructor.generateInstructionsToMoveOverXAxis(from: 1, to: 3)
        let expectedInstructions2: [Instruction] = [.moveEast, .moveEast]
        XCTAssertEqual(instructions2, expectedInstructions2)
        
        // Case #3
        let instructions3: [Instruction] = Instructor.generateInstructionsToMoveOverXAxis(from: 4, to: 1)
        let expectedInstructions3: [Instruction] = [.moveWest, .moveWest, .moveWest]
        XCTAssertEqual(instructions3, expectedInstructions3)
        
        // Case #4
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
    
    func test_generationOfInstructions() {
        // Given
        let sut = makeSUT()
        
        // Case #1
        
        let point1_1 = Location(x: 1, y: 3)
        let point1_2 = Location(x: 4, y: 4)
        
        // When #1
        sut.set(locations: [point1_1, point1_2])
        
        // Then #2
        let instructions1 = sut.generateInstructions()
        let expectedInstructions1: [Instruction] = [.moveEast, .moveNorth, .moveNorth, .moveNorth,
                                                    .dropPizza,
                                                    .moveEast, .moveEast, .moveEast, .moveNorth,
                                                    .dropPizza]
        XCTAssertEqual(instructions1, expectedInstructions1)
        
        // Case #2
        
        let point2_1 = Location(x: 1, y: 3)
        let point2_2 = Location(x: 4, y: 4)
        let point2_3 = Location(x: 4, y: 2)
        let point2_4 = Location(x: 4, y: 2)
        let point2_5 = Location(x: 0, y: 1)
        let point2_6 = Location(x: 3, y: 2)
        let point2_7 = Location(x: 2, y: 3)
        let point2_8 = Location(x: 4, y: 1)

        // When #2
        sut.set(locations: [point2_1, point2_2, point2_3, point2_4, point2_5, point2_6, point2_7, point2_8])
        
        // Then #2
        let instructions2 = sut.generateInstructions()
        let expectedInstructions2: [Instruction] = [.moveEast, .moveNorth, .moveNorth, .moveNorth, .dropPizza,
                                                    .moveEast, .moveEast, .moveEast, .moveNorth, .dropPizza,
                                                    .moveSouth, .moveSouth, .dropPizza,
                                                    .dropPizza,
                                                    .moveWest, .moveWest, .moveWest, .moveWest, .moveSouth,.dropPizza,
                                                    .moveEast, .moveEast, .moveEast, .moveNorth, .dropPizza,
                                                    .moveWest, .moveNorth, .dropPizza,
                                                    .moveEast, .moveEast, .moveSouth, .moveSouth, .dropPizza]
        XCTAssertEqual(instructions2, expectedInstructions2)
    }
    
    // MARK: - Helperrs
    
    private func makeSUT(map: Map = Map(width: 5, height: 5)) -> Instructor {
        return Instructor(map: map)
    }
}
