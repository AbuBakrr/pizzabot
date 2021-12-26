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

    // MARK: - Map size's argument validation
    
    func test_validMapSizeArgumentsAreValid() {
        XCTAssertTrue(ArgumentParser.validateMapSizeArgument("5x5"))
        XCTAssertTrue(ArgumentParser.validateMapSizeArgument("5X5"))
        XCTAssertTrue(ArgumentParser.validateMapSizeArgument("1x3"))
    }
    
    func test_invalidMapSizeArgumentsAreInvalid() {
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
    
    // MARK: - Location coordinate's argument validation
    
    func test_validLocationArguemntsAreValid() {
        XCTAssertTrue(ArgumentParser.validateLocationArgument("(0,0)"))
        XCTAssertTrue(ArgumentParser.validateLocationArgument("(1.2)"))
        XCTAssertTrue(ArgumentParser.validateLocationArgument("(12,2)"))
        XCTAssertTrue(ArgumentParser.validateLocationArgument("(0,02)"))
    }
    
    func test_invalidLocationArguemntsAreInvalid() {
        XCTAssertFalse(ArgumentParser.validateLocationArgument("(-1,2)"))
        XCTAssertFalse(ArgumentParser.validateLocationArgument("(1,-2)"))
        XCTAssertFalse(ArgumentParser.validateLocationArgument("(1,2"))
        XCTAssertFalse(ArgumentParser.validateLocationArgument("1,2)"))
        XCTAssertFalse(ArgumentParser.validateLocationArgument("(12)"))
        XCTAssertFalse(ArgumentParser.validateLocationArgument("(One, Two)"))
        XCTAssertFalse(ArgumentParser.validateLocationArgument(""))
    }

    // MARK: - Map argument parsing
    
    func test_parsesMapSizeArgument_whenPassed_5x5() {
        do {
            let map = try ArgumentParser.parseMapSize("5x5")
            let expectedMap = Map(width: 5, height: 5)
            XCTAssertEqual(map, expectedMap)
        } catch {
            XCTFail("Argument should have been parsed successfully. Check parsing and validation")
        }
    }
    
    func test_parseMapSizeThrows_invalidMapSizeArgument_whenPassed_5x5() {
        do {
            _ = try ArgumentParser.parseMapSize("(1,2")
            XCTFail("Parser was supposed to throw error. Check map size argument validation")
        } catch {
            XCTAssertEqual(error as? ParseError, ParseError.invalidMapSizeArgument)
        }
    }
    
    // MARK: - Location coordinate argument parsing
    
    func test_parsesLocationCoordinateArgument_whenPassed_3_4() {
        do {
            let location = try ArgumentParser.parseLocation("(3,4)")
            let expectedLocation = Location(x: 3, y: 4)
            XCTAssertEqual(location, expectedLocation)
        } catch {
            XCTFail("Argument should have been parsed successfully. Check parsing and validation")
        }
    }
    
    func test_parseLocationCoordinateThrows_invalidLocationCoordinateArgument_whenPassedInvalidValue() {
        do {
            _ = try ArgumentParser.parseLocation("(1, 2)")
            XCTFail("Parser was supposed to throw error. Check location coordinate argument validation")
        } catch {
            XCTAssertEqual(error as? ParseError, ParseError.invalidLocationCoordinateArgument)
        }
    }
    
    // MARK: - Filtering empty arguments
    
    func test_filteringEmptyArguments() {
        // Given
        let arguments = [
            "",
            " ",
            "5x5",
            "\n",
            "(1,3)",
            "  ",
            "(4,3)"
        ]
        
        // When
        let filteredArguments = ArgumentParser.filterEmptyArguments(arguments)
        // Then
        let expectedFilteredArguments = ["5x5", "(1,3)", "(4,3)"]
        XCTAssertEqual(filteredArguments, expectedFilteredArguments)
    }
}
