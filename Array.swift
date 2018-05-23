//
//  Array.swift
//  
//
//  Created by Viktor Olesenko on 27.04.18.
//  Copyright © 2018 Steelkiwi Inc. All rights reserved.
//

import Foundation

extension Array {
    
    // MARK: - Filter
    
    /// Filter array and returns list of unique passed objects / properties (should conform to Hashable protocol). Example: `unique({ $0.type })` returns an Array of `type` class objects
    func unique<ElementOfResult: Hashable>(_ transform: (Element) throws -> ElementOfResult?) rethrows -> Array<ElementOfResult> {
        let elements = try self.compactMap(transform)
        let uniqueSet = Set<ElementOfResult>.init(elements)
        
        return Array<ElementOfResult>.init(uniqueSet)
    }
    
    // MARK: - Shuffle
    // https://github.com/mergesort/Public-Extension/blob/54a76d67f9ea8de4605ecb57cc42e953748d6620/PublicExtension.playground/Pages/Array.xcplaygroundpage/Contents.swift#L54-L71
    
    mutating func shuffle() {
        // Empty and single-element collections don't shuffle
        guard count > 1 else { return }
        
        for i in startIndex ..< endIndex - 1 {
            let j = Int(arc4random_uniform(UInt32(endIndex - i))) + i
            if i != j {
                self.swapAt(i, j)
            }
        }
    }
    
    func shuffled() -> [Element] {
        var shuffledArray = self
        shuffledArray.shuffle()
        return shuffledArray
    }
}
