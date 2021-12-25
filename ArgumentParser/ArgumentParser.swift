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
    
    public static func parseLocationArguments( _ arguments: [String]) throws -> [Location] {
        var locations: [Location] = []
        
        for argument in arguments {
            guard argument.count > 3 else {
                throw ParseError.invalidLocationArgument
            }
            
            if argument.first == "(" && argument.last != ")" {
                throw ParseError.invalidLocationArgument
            }
            
            if argument.first != "(" && argument.last == ")" {
                throw ParseError.invalidLocationArgument
            }
            
            let arguments = argument
                .filter { "-0123456789,".contains($0) }
                .split(separator: ",")
            
            guard arguments.count == 2 else {
                throw ParseError.invalidLocationArgument
            }
            
            guard let x = Int(arguments[0]),
                  let y = Int(arguments[1]),
                  x >= 0, y >= 0 else {
                      throw ParseError.invalidLocationArgument
                  }
            
            locations.append(Location(x: x, y: y))
            
        }

        return locations
    }
}
