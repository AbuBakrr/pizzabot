//
//  Instructor.swift
//  Instructor
//
//  Created by Abu-Bakr Jabbarov on 12/22/21.
//

import Foundation

public final class DefaultInstructor: Instructor {
    
    // MARK: - Properties
    
    private let map: Map
    private let currentLocation: Location
    private(set) var locations: [Location] = []
    
    // MARK: - Init
    
    public init(map: Map, currentLocation: Location = Location(x: 0, y: 0)) {
        self.map = map
        self.currentLocation = currentLocation
    }
    
    public func set(locations: [Location]) {
        self.locations = locations.filter { map.includes(location: $0) }
    }
    
    public func generateInstructions() -> [Instruction] {
        var instructions: [Instruction] = []
        var startingPoint = currentLocation
        
        for location in locations {
            let moveInstructions = DefaultInstructor.generateInstructionsToMove(from: startingPoint, to: location)
            instructions.append(contentsOf: moveInstructions)
            instructions.append(.dropPizza)
            startingPoint = location
        }
        return instructions
    }
    
    static func generateInstructionsToMove(from start: Location, to end: Location) -> [Instruction] {
        return generateInstructionsToMoveOverXAxis(from: start.x, to: end.x) + generateInstructionsToMoveOverYAxis(from: start.y, to: end.y)
    }
    
    static func generateInstructionsToMoveOverXAxis(from start: Int, to end: Int) -> [Instruction] {
        let distance = end - start
        let count = abs(distance)
        let instruction: Instruction = distance > 0 ? .moveEast : .moveWest
        
        return [Instruction](repeating: instruction, count: count)
    }
    
    static func generateInstructionsToMoveOverYAxis(from start: Int, to end: Int) -> [Instruction] {
        let distance = end - start
        let count = abs(distance)
        let instruction: Instruction = distance > 0 ? .moveNorth : .moveSouth
        
        return [Instruction](repeating: instruction, count: count)
    }
}
