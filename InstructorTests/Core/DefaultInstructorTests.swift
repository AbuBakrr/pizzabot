//
//  InstructorTests.swift
//  InstructorTests
//
//  Created by Abu-Bakr Jabbarov on 12/21/21.
//

import XCTest
@testable import Instructor

class DefaultInstructorTests: XCTestCase {
    
    func test_setLocationsFiltersOutNonIncludedPoints() {
        // Given
        let sut = makeSUT()
        let locations: [Location] = [
            Location(x: 6, y: 6),
            Location(x: 1, y: 2),
            Location(x: 0, y: 0),
            Location(x: 0, y: 6)
        ]
        
        // When
        sut.set(locations: locations)
        
        // Then
        XCTAssertEqual(sut.locations, [Location(x: 1, y: 2), Location(x: 0, y: 0)])
    }
    
    // MARK: - Movement over X axis
    
    func test_generationOfMovemenetsOverXAxisFrom_0_to_0() {
        let instructions1: [Instruction] = DefaultInstructor.generateInstructionsToMoveOverXAxis(from: 0, to: 0)
        let expectedInstructions1: [Instruction] = []
        XCTAssertEqual(instructions1, expectedInstructions1)
    }
    
    func test_generationOfMovemenetsOverXAxisFrom_1_to_3() {
        let instructions2: [Instruction] = DefaultInstructor.generateInstructionsToMoveOverXAxis(from: 1, to: 3)
        let expectedInstructions2: [Instruction] = [.moveEast, .moveEast]
        XCTAssertEqual(instructions2, expectedInstructions2)
    }
    
    func test_generationOfMovemenetsOverXAxisFrom_4_to_3() {
        let instructions3: [Instruction] = DefaultInstructor.generateInstructionsToMoveOverXAxis(from: 4, to: 3)
        let expectedInstructions3: [Instruction] = [.moveWest]
        XCTAssertEqual(instructions3, expectedInstructions3)
    }
    
    // MARK: - Movement over Y axis
    
    func test_generationOfMovemenetsOverYAxisFrom_0_to_0() {
        let instructions1: [Instruction] = DefaultInstructor.generateInstructionsToMoveOverYAxis(from: 0, to: 0)
        let expectedInstructions1: [Instruction] = []
        XCTAssertEqual(instructions1, expectedInstructions1)
    }
    
    func test_generationOfMovemenetsOverYAxisFrom_1_to_3() {
        let instructions2: [Instruction] = DefaultInstructor.generateInstructionsToMoveOverYAxis(from: 1, to: 3)
        let expectedInstructions2: [Instruction] = [.moveNorth, .moveNorth]
        XCTAssertEqual(instructions2, expectedInstructions2)
    }
    
    func test_generationOfMovemenetsOverYAxisFrom_4_to_1() {
        let instructions3: [Instruction] = DefaultInstructor.generateInstructionsToMoveOverYAxis(from: 4, to: 1)
        let expectedInstructions3: [Instruction] = [.moveSouth, .moveSouth, .moveSouth]
        XCTAssertEqual(instructions3, expectedInstructions3)
    }
    
    func test_generationOfMovement_from_0_0_to_0_0() {
        let start1 = Location(x: 0, y: 0)
        let end1 = Location(x: 0, y: 0)
        let instructions1 = DefaultInstructor.generateInstructionsToMove(from: start1, to: end1)
        let expectedInstructions1: [Instruction] = []
        XCTAssertEqual(instructions1, expectedInstructions1)
    }
    
    func test_generationOfMovement_from_0_0_to_1_3() {
        let start2 = Location(x: 0, y: 0)
        let end2 = Location(x: 1, y: 3)
        let instructions2 = DefaultInstructor.generateInstructionsToMove(from: start2, to: end2)
        let expectedInstructions2: [Instruction] = [.moveEast, .moveNorth, .moveNorth, .moveNorth]
        XCTAssertEqual(instructions2, expectedInstructions2)
    }
   
    func test_generationOfMovement_from_1_3_to_4_4() {
        let start3 = Location(x: 1, y: 3)
        let end3 = Location(x: 4, y: 4)
        let instructions3 = DefaultInstructor.generateInstructionsToMove(from: start3, to: end3)
        let expectedInstructions3: [Instruction] = [.moveEast, .moveEast, .moveEast, .moveNorth]
        XCTAssertEqual(instructions3, expectedInstructions3)
    }
    
    func test_generationOfMovement_from_4_2_to_0_0() {
        let start4 = Location(x: 4, y: 2)
        let end4 = Location(x: 0, y: 0)
        let instructions4 = DefaultInstructor.generateInstructionsToMove(from: start4, to: end4)
        let expectedInstructions4: [Instruction] = [.moveWest, .moveWest, .moveWest, .moveWest, .moveSouth, .moveSouth]
        XCTAssertEqual(instructions4, expectedInstructions4)
    }
    
    func test_generationOfMovement_from_1_1_to_2_2() {
        let start5 = Location(x: 1, y: 1)
        let end5 = Location(x: 2, y: 1)
        let instructions5 = DefaultInstructor.generateInstructionsToMove(from: start5, to: end5)
        let expectedInstructions5: [Instruction] = [.moveEast]
        XCTAssertEqual(instructions5, expectedInstructions5)
    }
    
    func test_generationOfInstructions_case_1() {
        // Given
        let sut = makeSUT()
        let point1 = Location(x: 1, y: 3)
        let point2 = Location(x: 4, y: 4)
        
        // When #1
        sut.set(locations: [point1, point2])
        
        // Then #2
        let instructions = sut.generateInstructions()
        let expectedInstructions: [Instruction] = [.moveEast, .moveNorth, .moveNorth, .moveNorth,
                                                    .dropPizza,
                                                    .moveEast, .moveEast, .moveEast, .moveNorth,
                                                    .dropPizza]
        XCTAssertEqual(instructions, expectedInstructions)
    }
    
    func test_generationOfInstructions_case_2() {
        // Given
        let sut = makeSUT()
        let point1 = Location(x: 1, y: 3)
        let point2 = Location(x: 4, y: 4)
        let point3 = Location(x: 4, y: 2)
        let point4 = Location(x: 4, y: 2)
        let point5 = Location(x: 0, y: 1)
        let point6 = Location(x: 3, y: 2)
        let point7 = Location(x: 2, y: 3)
        let point8 = Location(x: 4, y: 1)

        // When
        sut.set(locations: [point1, point2, point3, point4, point5, point6, point7, point8])
        
        // Then
        let instructions = sut.generateInstructions()
        let expectedInstructions: [Instruction] = [.moveEast, .moveNorth, .moveNorth, .moveNorth, .dropPizza,
                                                    .moveEast, .moveEast, .moveEast, .moveNorth, .dropPizza,
                                                    .moveSouth, .moveSouth, .dropPizza,
                                                    .dropPizza,
                                                    .moveWest, .moveWest, .moveWest, .moveWest, .moveSouth,.dropPizza,
                                                    .moveEast, .moveEast, .moveEast, .moveNorth, .dropPizza,
                                                    .moveWest, .moveNorth, .dropPizza,
                                                    .moveEast, .moveEast, .moveSouth, .moveSouth, .dropPizza]
        XCTAssertEqual(instructions, expectedInstructions)
    }
    
    // MARK: - Helperrs
    
    private func makeSUT(map: Map = Map(width: 5, height: 5)) -> DefaultInstructor {
        return DefaultInstructor(map: map)
    }
}
