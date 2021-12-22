//
//  InstructionTests.swift
//  InstructorTests
//
//  Created by Abu-Bakr Jabbarov on 12/22/21.
//

import XCTest
import Instructor

class InstructionTests: XCTestCase {
    
    func test_instructionIdentifier() {
        XCTAssertEqual(Instruction.moveEast.command, "E")
        XCTAssertEqual(Instruction.moveNorth.command, "N")
        XCTAssertEqual(Instruction.moveWest.command, "W")
        XCTAssertEqual(Instruction.moveSouth.command, "S")
        XCTAssertEqual(Instruction.dropPizza.command, "D")
    }
}
