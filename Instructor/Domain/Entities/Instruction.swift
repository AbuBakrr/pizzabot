//
//  Instruction.swift
//  Instructor
//
//  Created by Abu-Bakr Jabbarov on 12/21/21.
//

import Foundation

public enum Instruction {
    
    case moveNorth
    case moveSouth
    case moveEast
    case moveWest
    case dropPizza
    
    public var command: String {
        switch self {
        case .moveNorth: return "N"
        case .moveSouth: return "S"
        case .moveEast: return "E"
        case .moveWest: return "W"
        case .dropPizza: return "D"
        }
    }
}
