//
//  Date+Compare.swift
//  
//
//  Created by Viktor Olesenko on 20.04.17.
//
//

import Foundation

extension Date {
    static func <(a: Date, b: Date) -> Bool {
        return a.compare(b) == .orderedAscending
    }
    
    static func ==(a: Date, b: Date) -> Bool {
        return a.compare(b) == .orderedSame
    }
}
