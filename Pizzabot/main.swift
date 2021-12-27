//
//  main.swift
//  Pizzabot
//
//  Created by Abu-Bakr Jabbarov on 12/21/21.
//
import Foundation
import ArgumentParser
import Instructor

do {
    let tuple = try ArgumentParser.parse(Array(CommandLine.arguments.dropFirst()))
    let instructor = Instructor(map: tuple.map)
    instructor.set(locations: tuple.locations)
    print(instructor.generateInstructions().map {$0.command }.joined() )
} catch {
    print(error.localizedDescription)
}


