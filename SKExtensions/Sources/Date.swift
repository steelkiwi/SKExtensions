//
//  Date.swift
//  
//
//  Created by Viktor Olesenko on 20.04.17.
//
//

import Foundation

public extension Date {
    
    public var isToday: Bool { return Calendar.current.isDateInToday(self) }
}
