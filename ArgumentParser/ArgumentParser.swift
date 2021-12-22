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
}
