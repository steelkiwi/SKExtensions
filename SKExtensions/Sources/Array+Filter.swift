//
//  Array+Filter.swift
//  
//
//  Created by Viktor Olesenko on 27.04.18.
//  Copyright © 2018 Steelkiwi Inc. All rights reserved.
//

import Foundation

public extension Array {
    
    // MARK: - Filter
    
    /// Filter array and returns list of unique passed objects / properties (should conform to Hashable protocol). Example: `unique({ $0.type })` returns an Array of `type` class objects
    public func uniqueElements<ElementOfResult: Hashable>(_ transform: (Element) throws -> ElementOfResult?) rethrows -> Array<ElementOfResult> {
        let elements = try self.compactMap(transform)
        let uniqueSet = Set<ElementOfResult>.init(elements)
        
        return Array<ElementOfResult>.init(uniqueSet)
    }
}
