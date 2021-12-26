//
//  ArgumentParserTests.swift
//  ArgumentParserTests
//
//  Created by Abu-Bakr Jabbarov on 12/22/21.
//

import XCTest
import Instructor
import ArgumentParser

class ArgumentParserTests: XCTestCase {

    func test_firstArgumentValidation() {
        XCTAssertTrue(ArgumentParser.validateMapSizeArgument("5x5"))
        XCTAssertTrue(ArgumentParser.validateMapSizeArgument("5X5"))
        XCTAssertTrue(ArgumentParser.validateMapSizeArgument("1x3"))
    
        XCTAssertFalse(ArgumentParser.validateMapSizeArgument("0x0"))
        XCTAssertFalse(ArgumentParser.validateMapSizeArgument(" 5x5"))
        XCTAssertFalse(ArgumentParser.validateMapSizeArgument("(5x5)"))
        XCTAssertFalse(ArgumentParser.validateMapSizeArgument("[5x5]"))
        XCTAssertFalse(ArgumentParser.validateMapSizeArgument("-5x5"))
        XCTAssertFalse(ArgumentParser.validateMapSizeArgument("2x0"))
        XCTAssertFalse(ArgumentParser.validateMapSizeArgument("5x-5"))
        XCTAssertFalse(ArgumentParser.validateMapSizeArgument("5x3x3"))
        XCTAssertFalse(ArgumentParser.validateMapSizeArgument(""))
        XCTAssertFalse(ArgumentParser.validateMapSizeArgument(" "))
    }
    
    func test_locationArguemntsAreValid() {
        XCTAssertTrue(ArgumentParser.validateLocationArgument("(0,0)"))
        XCTAssertTrue(ArgumentParser.validateLocationArgument("(1.2)"))
        XCTAssertTrue(ArgumentParser.validateLocationArgument("(12,2)"))
        XCTAssertTrue(ArgumentParser.validateLocationArgument("(0,02)"))
    }
    
    func test_locationArguemntsAreInvalid() {
        XCTAssertFalse(ArgumentParser.validateLocationArgument("(-1,2)"))
        XCTAssertFalse(ArgumentParser.validateLocationArgument("(1,-2)"))
        XCTAssertFalse(ArgumentParser.validateLocationArgument("(1,2"))
        XCTAssertFalse(ArgumentParser.validateLocationArgument("1,2)"))
        XCTAssertFalse(ArgumentParser.validateLocationArgument("(12)"))
        XCTAssertFalse(ArgumentParser.validateLocationArgument("(One, Two)"))
        XCTAssertFalse(ArgumentParser.validateLocationArgument(""))
    }
    
//    func test_argumentParsing() {
//        // Case #1
//        
//        let arguments1 = ["5x5", "(1, 3)", "(4, 4)"]
//        let result1 = try! ArgumentParser.parse(arguments: arguments1)
//        let expectedMap1 = Map(width: 5, height: 5)
//        let expectedLocations1: [Location] = [
//            Location(x: 1, y: 3),
//            Location(x: 4, y: 4),
//        ]
//        
//        XCTAssertEqual(result1.map, expectedMap1)
//        XCTAssertEqual(result1.locations, expectedLocations1)
//    }
}
