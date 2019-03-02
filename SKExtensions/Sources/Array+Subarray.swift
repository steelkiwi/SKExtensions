//
//  Array+Subarray.swift
//  
//
//  Created by Viktor Olesenko on 09.06.18.
//  Copyright © 2018 Viktor Olesenko. All rights reserved.
//

import UIKit

public extension Array where Element: Equatable {
    
    /// Returns a Boolean value indicating whether the sequence contains an elements from the given subArray
    public func contains(_ subArray: [Element]) -> Bool {
        for element in subArray {
            guard self.contains(element) else {
                return false
            }
        }
        
        return true
    }
    
    /// Returns true, if current array contains all elements from subarray in same order and without breaks
    /// Example: [A, B, C] contains [B, C], but not contains [A, C]
    public func contains(inseparable subArray: [Element]) -> Bool {
        
        // This is to prevent construction of a range from zero to negative
        guard self.count >= subArray.count else { return false }
        
        // The index of the match could not exceed data.count-part.count
        let index = (0 ... self.count - subArray.count).index { (index) -> Bool in
            // Construct a sub-array from current index,
            // and compare its content to what we are looking for.
            [Element](self[index ..< index + subArray.count]) == subArray
        }
        
        return index != nil
    }
}
