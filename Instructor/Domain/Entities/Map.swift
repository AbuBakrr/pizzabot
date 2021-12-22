//
//  Map.swift
//  Instructor
//
//  Created by Abu-Bakr Jabbarov on 12/21/21.
//

import Foundation

public struct Map {
    
    // MARK: - Properties
    
    let width: Int
    let height: Int
    
    // MARK: - Init
    
    public init(width: Int, height: Int) {
        guard width > 0, height > 0 else { fatalError("Width and height must be larger than zero!") }
        self.width = width
        self.height = height
    }
    
    // MARK: - Methods
    
    public func includes(location: Location) -> Bool {
        guard location.x >= 0, location.x <= width,
              location.y >= 0, location.y <= height else {
                  return false
              }
        return true
    }
}
