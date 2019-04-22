//
//  DateFormatter.swift
//  
//
//  Created by Viktor Olesenko on 20.04.17.
//
//

import Foundation

public extension DateFormatter {
    
    convenience init(dateFormat: String) {
        self.init()
        self.dateFormat = dateFormat
    }
}
