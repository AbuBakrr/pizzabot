//
//  ParseError.swift
//  ArgumentParser
//
//  Created by Abu-Bakr Jabbarov on 12/22/21.
//

import Foundation

enum ParseError: LocalizedError {
    
    case invalidArguments
    case invalidMapSizeArgument
    case invalidLocationArgument
    
    var errorDescription: String? {
        switch self {
        case .invalidArguments:
            return "Error while parsing arguments. Please, pass valid arguments. Ex: 5x5 (1, 3) (4, 4)"
        case .invalidMapSizeArgument:
            return "An invalid first argument is passed"
        case .invalidLocationArgument:
            return "Invalid argument is passed for location"
            
        }
    }
}
