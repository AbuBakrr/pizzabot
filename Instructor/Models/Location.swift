//
//  Location.swift
//  Instructor
//
//  Created by Abu-Bakr Jabbarov on 12/21/21.
//

import Foundation

public struct Location: Equatable {
    
    public let x: Int
    public let y: Int
    
    public init(x: Int, y: Int) {
        guard x >= 0, y >= 0 else { fatalError("X and Y coordinates must be larger than or equal to zero!") }
        self.x = x
        self.y = y
    }
}
