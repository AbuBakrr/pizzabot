//
//  ParseError.swift
//  ArgumentParser
//
//  Created by Abu-Bakr Jabbarov on 12/22/21.
//

import Foundation

public enum ParseError: LocalizedError {
    
    case invalidArguments
    case invalidMapSizeArgument
    case invalidLocationArgument
    
    public var errorDescription: String? {
        switch self {
        case .invalidArguments:
            return "Error while parsing arguments. Please, pass valid arguments. Ex: 5x5 (1, 3) (4, 4)"
        case .invalidMapSizeArgument:
            return "An invalid map size argument is passed"
        case .invalidLocationArgument:
            return "Invalid argument(s) is(are) passed for location coordinate(s)"
        }
    }
}
