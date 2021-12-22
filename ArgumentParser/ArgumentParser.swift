//
//  ArgumentParser.swift
//  ArgumentParser
//
//  Created by Abu-Bakr Jabbarov on 12/22/21.
//

import Foundation

public final class ArgumentParser {

    public static func validateFirstArgument( _ argument: String) -> Bool {
        let arguments = argument.split(separator: "x")
        guard arguments.count == 2,
              let first = Int(arguments[0]),
              first > 0,
              let second = Int(arguments[1]),
              second > 0
        else { return false }
        
        return true
    }
    
    public static func validateLocationArgument( _ argument: String) -> Bool {
        guard argument.count > 3 else {
            return false
        }
        
        if argument.first == "(" && argument.last != ")" {
            return false
        }
        
        if argument.first != "(" && argument.last == ")" {
            return false
        }
        
        let arguments = argument
            .filter { "-0123456789,".contains($0) }
            .split(separator: ",")
        
        guard arguments.count == 2 else {
            return false
        }
        
        guard let first = Int(arguments[0]),
              let second = Int(arguments[1]),
              first >= 0,
              second >= 0 else {
                  return false
              }
        
        return true
    }
}
