//
//  ArgumentParser.swift
//  ArgumentParser
//
//  Created by Abu-Bakr Jabbarov on 12/22/21.
//

import Foundation
import Instructor

public final class ArgumentParser {

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
    
    public static func parseFirstArgument( _ argument: String) throws -> Map {
        let arguments = argument.split(separator: "x")
        guard arguments.count == 2,
              let width = Int(arguments[0]),
              let height = Int(arguments[1]),
              width > 0, height > 0 else {
                  throw ParseError.invalidMapSizeArgument
              }
        
        return Map(width: width, height: height)
    }
    
    public static func validateMapSizeArgument( _ argument: String) -> Bool {
        let regex: String = "^[1-9]" + "(\\d*)" + "(x|X)" + "[1-9]" + "(\\d*)$"
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
