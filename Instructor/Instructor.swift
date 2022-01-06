//
//  Instructor.swift
//  Instructor
//
//  Created by Abu-Bakr Jabbarov on 1/6/22.
//

import Foundation

public protocol Instructor {
    func set(locations: [Location])
    func generateInstructions() -> [Instruction]
}
