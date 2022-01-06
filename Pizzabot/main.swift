//
//  main.swift
//  Pizzabot
//
//  Created by Abu-Bakr Jabbarov on 12/21/21.
//
import Foundation
import Instructor
import ArgumentParser

do {
    let (map, locations) = try ArgumentParser.parse(Array(CommandLine.arguments.dropFirst()))
    let instructor: Instructor = DefaultInstructor(map: map)
    instructor.set(locations: locations)
    
    print(instructor.generateInstructions().map {$0.command }.joined() )
    
} catch {
    print(error.localizedDescription, "Please, pass valid arguments. Ex: 5x5 (1,3) (4,4)")
}


