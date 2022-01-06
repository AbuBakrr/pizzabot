//
//  ArgumentParserTests.swift
//  ArgumentParserTests
//
//  Created by Abu-Bakr Jabbarov on 12/22/21.
//

import XCTest
import Instructor
@testable import ArgumentParser

class ArgumentParserTests: XCTestCase {

    // MARK: - Map size's argument validation
    
    func test_validMapSize_whenPassed_validArgument() {
        XCTAssertTrue(ArgumentParser.validateMapSizeArgument("5x5"))
        XCTAssertTrue(ArgumentParser.validateMapSizeArgument("1x3"))
    }
    
    // MARK: - Map size's argument invalidation
    
    func test_invalidMapSize_whenValuesAre_lessThanOrEqualToZero() {
        // Width and height of map cannot be less than or equal to zero
        XCTAssertFalse(ArgumentParser.validateMapSizeArgument("0x0"))
        XCTAssertFalse(ArgumentParser.validateMapSizeArgument("2x0"))
        XCTAssertFalse(ArgumentParser.validateMapSizeArgument("-5x5"))
        XCTAssertFalse(ArgumentParser.validateMapSizeArgument("5x-5"))
    }
    
    func test_invalidMapSize_whenArgumentHas_extraSpaces() {
        XCTAssertFalse(ArgumentParser.validateMapSizeArgument(" 5x5"))
        XCTAssertFalse(ArgumentParser.validateMapSizeArgument("5x5 "))
        XCTAssertFalse(ArgumentParser.validateMapSizeArgument(" 5x5 "))
    }
    
    func test_invalidMapSize_whenArgumentHas_parenthesis() {
        XCTAssertFalse(ArgumentParser.validateMapSizeArgument("(5x5)"))
        XCTAssertFalse(ArgumentParser.validateMapSizeArgument("5x5)"))
        XCTAssertFalse(ArgumentParser.validateMapSizeArgument("(5x5"))
    }
    
    func test_invalidMapSize_whenArgumentIs_empty() {
        XCTAssertFalse(ArgumentParser.validateMapSizeArgument(""))
        XCTAssertFalse(ArgumentParser.validateMapSizeArgument(" "))
    }
    
    // MARK: - Location coordinate's argument validation
    
    func test_validLocationArgument_whenArgumentIs_valid() {
        XCTAssertTrue(ArgumentParser.validateLocationArgument("(0,0)"))
        XCTAssertTrue(ArgumentParser.validateLocationArgument("(1.2)"))
        XCTAssertTrue(ArgumentParser.validateLocationArgument("(12,2)"))
        XCTAssertTrue(ArgumentParser.validateLocationArgument("(0,02)"))
    }
    
    // MARK: - Location coordinate's argument invalidation
    
    func test_invalidLocationArgument_whenArgumentHas_extraSpaces() {
        XCTAssertFalse(ArgumentParser.validateLocationArgument("(3, 4)"))
        XCTAssertFalse(ArgumentParser.validateLocationArgument(" (3,4)"))
        XCTAssertFalse(ArgumentParser.validateLocationArgument("(3,4) "))
    }
    
    func test_invalidLocationArgument_whenArguemntHas_noParentheses() {
        XCTAssertFalse(ArgumentParser.validateLocationArgument("3,4"))
    }
    
    func test_invalidLocationArgument_whenArgumentHas_noLeadingParentheses() {
        XCTAssertFalse(ArgumentParser.validateLocationArgument("1,2)"))
    }
    
    func test_invalidLocationArgument_whenArgumentHas_noTrailingParentheses() {
        XCTAssertFalse(ArgumentParser.validateLocationArgument("(1,2"))
    }
    
    func test_invalidLocationArgument_whenArgumentHas_negativeValues() {
        XCTAssertFalse(ArgumentParser.validateLocationArgument("(-1,2)"))
        XCTAssertFalse(ArgumentParser.validateLocationArgument("(1,-2)"))
    }
    
    func test_invalidLocationArgument_whenArgumentIs_single() {
        XCTAssertFalse(ArgumentParser.validateLocationArgument("(12)"))
        XCTAssertFalse(ArgumentParser.validateLocationArgument("12"))
    }
    
    func test_invalidLocationArgument_whenArgumentIs_empty() {
        XCTAssertFalse(ArgumentParser.validateLocationArgument(""))
        XCTAssertFalse(ArgumentParser.validateLocationArgument(" "))
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
    
    func test_parseMapSizeThrows_invalidMapSizeArgument_whenPassedArgumentWithParenthesisAndComma() {
        do {
            _ = try ArgumentParser.parseMapSize("(1,2)")
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
    
    func test_parseLocationCoordinateThrows_invalidLocationCoordinateArgument_whenPassedValuesWithoutParenthesis() {
        do {
            _ = try ArgumentParser.parseLocation("1,2")
            XCTFail("Parser was supposed to throw error. Check location coordinate argument validation")
        } catch {
            XCTAssertEqual(error as? ParseError, ParseError.invalidLocationCoordinateArgument)
        }
    }
    
    // MARK: - Filtering empty arguments
    
    func test_filtersEmptyArguments() {
        // Given
        let arguments = ["", " ", "5x5", "\n", "1,3", "  ", "4,3"]
        
        // When
        let filteredArguments = ArgumentParser.filterEmptyArguments(arguments)
        // Then
        let expectedFilteredArguments = ["5x5", "1,3", "4,3"]
        XCTAssertEqual(filteredArguments, expectedFilteredArguments)
    }
    
    // MARK: - Parsing
    
    func test_parseArgumentsReturnsTupleOfMapAndLocations() {
        // Given
        let arguments = ["", " ", "5x5", "\n", "(1,3)", "  ", "(4,3)"]
        
        do {
            // When
            let tuple: (map: Map, locations: [Location]) = try ArgumentParser.parse(arguments)
            let expectedTuple: (map: Map, locations: [Location]) = (Map(width: 5, height: 5), [Location(x: 1, y: 3), Location(x: 4, y: 3)])
            
            // Then
            XCTAssertEqual(tuple.map, expectedTuple.map)
            XCTAssertEqual(tuple.locations, expectedTuple.locations)
        } catch {
            XCTFail("Error: \(error). Parsing was supposed to be successful")
        }
    }
    
    func test_parseThrows_invalidArguments_whenNumberOfArgumentsLessThanExpectedOrIncorrect() {
        // Given
        let arguments = [" ", "4x4"]
        
        do {
            // When
            _ = try ArgumentParser.parse(arguments)
            XCTFail("An exception was supposed to be thrown")
        } catch {
            XCTAssertEqual(error as? ParseError, ParseError.invalidArguments)
        }
    }
    
    func test_parseThrows_invalidMapSizeArgument_whenPassedInvalidMapSizeArgument() {
        // Given
        let arguments = ["0x5", "1,3", "4,3"]
        
        do {
            // When
            _ = try ArgumentParser.parse(arguments)
            XCTFail("An exception was supposed to be thrown")
        } catch {
            XCTAssertEqual(error as? ParseError, ParseError.invalidMapSizeArgument)
        }
    }
    
    func test_parseThrows_invalidLocationCoordinateArgument_whenPassedAnInvalidLocationCoordinate() {
        // Given
        let arguments = ["5x5", "1,3", "4,3", "1, 4"]
        
        do {
            // When
            _ = try ArgumentParser.parse(arguments)
            XCTFail("An exception was supposed to be thrown")
        } catch {
            XCTAssertEqual(error as? ParseError, ParseError.invalidLocationCoordinateArgument)
        }
    }
}
