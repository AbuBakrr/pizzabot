//
//  ArgumentParserTests.swift
//  ArgumentParserTests
//
//  Created by Abu-Bakr Jabbarov on 12/22/21.
//

import XCTest
import ArgumentParser

class ArgumentParserTests: XCTestCase {

    func test_firstArgumentValidation() {
        XCTAssertTrue(ArgumentParser.validateFirstArgument("5x5"))
        XCTAssertTrue(ArgumentParser.validateFirstArgument("1x3"))
        
        XCTAssertFalse(ArgumentParser.validateFirstArgument("(5x5)"))
        XCTAssertFalse(ArgumentParser.validateFirstArgument("[5x5]"))
        XCTAssertFalse(ArgumentParser.validateFirstArgument("-5x5"))
        XCTAssertFalse(ArgumentParser.validateFirstArgument("2x0"))
        XCTAssertFalse(ArgumentParser.validateFirstArgument("5x-5"))
        XCTAssertFalse(ArgumentParser.validateFirstArgument("5x3x3"))
    }
    
    func test_locationArgumentsValidation() {
        
    }
}
