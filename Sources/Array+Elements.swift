//
//  Array+Elements.swift
//
//
//  Created by Viktor Olesenko on 30.08.18.
//  Copyright © 2018 Steelkiwi. All rights reserved.
//

import Foundation

public extension Array where Element: Equatable {
    
    public func before(_ element: Element) -> Element? {
        guard let index = self.index(of: element),
            element != self.first else {
                return nil
        }
        
        let prevIndex = self.index(before: Int(index))
        
        return self[prevIndex]
    }
    
    public func after(_ element: Element) -> Element? {
        guard let index = self.index(of: element),
            element != self.last else {
                return nil
        }
        
        let nextIndex = self.index(after: Int(index))
        
        return self[nextIndex]
    }    
}
