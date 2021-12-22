//
//  DistanceCalculator.swift
//  Instructor
//
//  Created by Abu-Bakr Jabbarov on 12/22/21.
//

import Foundation

public final class DistanceCalculator {
    
    public static func measureDistance(from start: Location, to end: Location) -> Int {
        return abs(start.x - end.x) + abs(start.y - end.y)
    }
}
