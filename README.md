# Pizzabot challenge

Pizzabot is a concept robot that will be delivering pizzas to clients. 

## Description

Pizzabot always starts at the origin point, (0, 0). As with a Cartesian plane, this point lies at the most south-westerly point of the grid. 
The solution is supposed to give instructions to the bot for deliveries

Refer to [this](https://github.com/AbuBakrr/pizzabot/blob/main/Description.pdf) file for more details

## System

IDE `Xcode 13.1` 
Language `Swift 5.5`. 

## Execution

1. Open terminal.
2. Navigate the folder where the source files are located. 
3. Navigate to 'Executable' folder.
4. Run executable file by typing either:

```bash
User$ ./pizzabot 5x5 '(0,0)' '(1,3)' '(4,4)'
DENNNDEEEND
```
or
```bash
User$ ./pizzabot 5x5 \(0,0\) \(1,3\) \(4,4\)
DENNNDEEEND
```
    
You can pass your own argumenents to the bot. As long as your inputs are valid, `Pizzabot` will be giving you instructions for delivery of pizzas.

### Invalid input handling
In case of invalid input, the program prints out an error description and an example for valid input.  
For example: 
```bash
User$ ./pizzabot 5x0 '(0,0)' '(1,3)' '(4,4)'
Invalid map size argument is passed. Please, pass valid arguments. Ex: 5x5 (1,3) (4,4)
```

## Implementation approach
### Instructor
The core part of the solution for this challenge is implemented as a separate module inside `Instructor` library and it provides an abstraction layer through a protocol called `Instructor', making it easy to replace default implementation whenever it is needed 

```swift
import Foundation

public protocol Instructor {
    func set(locations: [Location])
    func generateInstructions() -> [Instruction]
}
```
Here are the main concepts for my default implementation: 
- The first method, filters out locations that are located outside of the given map
- The second method generates instructions for the bot. At first, it takes the first location from array and generates instructions for moving over x axis, then for y axis. After that it generates an instruction to drop and moves on with the remaining locations.

### Instruction
It is an enumaration that consists of 5 instructions: `moveNorth`, `moveSouth`, `moveEast`, `moveWest`, `dropPizza`,

### Map and Location
They are very simple models that are designed using structs.  
`Map` consists of `width` and `height` parameters and it has a prevention logic that blocks negative and zero values.. The same goes with the `Location` model as well.   

### Unit tests
All expected behaviours are covered with unit tests. 
