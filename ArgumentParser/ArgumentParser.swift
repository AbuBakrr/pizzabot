//
//  ArgumentParser.swift
//  ArgumentParser
//
//  Created by Abu-Bakr Jabbarov on 12/22/21.
//

import Foundation
import Instructor

public final class ArgumentParser {

    public static func parseMapSize( _ argument: String) throws -> Map {
        guard ArgumentParser.validateMapSizeArgument(argument) else {
            throw ParseError.invalidMapSizeArgument
        }
        
        let arguments = argument.replacingOccurrences(of: "X", with: "x").split(separator: "x")
        let width = Int(arguments[0])!
        let height = Int(arguments[1])!
        return Map(width: width, height: height)
    }
    
//    public static func parse(arguments: [String]) throws -> (map: Map, locations: [Location]) {
//        let cleanArguments = arguments
//            .filter { !$0.isEmpty }
//            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
//            
//        guard cleanArguments.count > 2 else {
//            throw ParseError.invalidArguments
//        }
//        
//        let firstArgument = cleanArguments[0]
//        let locationArguments: [String] = Array(cleanArguments.dropFirst())
//        
////        guard ArgumentParser.parseFirstArgument(firstArgument) else {
////            throw ParseError.invalidMapSizeArgument
////        }
//        
////        for locationArgument in locationArguments {
////            if ArgumentParser.validateLocationArgument(locationArgument) == false {
////                throw ParseError.invalidLocationArgument
////            }
////        }
//        
//    }
    
    public static func validateMapSizeArgument( _ argument: String) -> Bool {
        // ^[1-9](\\d*) - Map size argument should start with non zero integer
        // (x|X) - followed by x or X character
        // [1-9](\\d*)$ - Finally it should end with non zero integer
        let regex: String = "^[1-9](\\d*)" + "(x|X)" + "[1-9](\\d*)$"
        let isValid = argument.range(of: regex, options: .regularExpression) != nil
        return isValid
    }
    
    public static func validateLocationArgument( _ argument: String) -> Bool {
        // ^\\( - Argument should start with an opening prefix
        // \\d+) - followed by a positive digit
        // (,|.) - followed by a comma or a dot
        // (\\d+) - followed by a positive digit
        // \\)$ - finally ended with a closing parenthesis
        let regex: String = "^\\(" + "(\\d+)" + "(,|.)" + "(\\d+)" + "\\)$"
        let isValid = argument.range(of: regex, options: .regularExpression) != nil
        return isValid
    }
}
