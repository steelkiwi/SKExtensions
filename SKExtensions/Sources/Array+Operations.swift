//
//  Array+Operations.swift
//  
//
//  Created by Viktor Olesenko on 20.08.18.
//  Copyright © 2018 Steelkiwi. All rights reserved.
//

import Foundation

public extension Array where Element == Int {
    
    var sum: Int {
        return self.reduce(0, +)
    }
}

public extension Array where Element == Double {
    
    var sum: Double {
        return self.reduce(0, +)
    }
}
