//
//  Int+Counters.swift
//  
//
//  Created by Viktor Olesenko on 05.09.18.
//  Copyright © 2018 Steelkiwi. All rights reserved.
//

import UIKit

public extension Int {
    
    mutating func increment(limit: Int? = nil) {
        if let limit = limit {
            guard self != limit else { return }
        }
        
        self += 1
    }
    
    mutating func decrement(limit: Int? = nil) {
        if let limit = limit {
            guard self != limit else { return }
        }
        
        self -= 1
    }
}
