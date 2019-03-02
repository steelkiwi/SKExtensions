//
//  String.swift
//
//
//  Created by Viktor Olesenko on 16.11.17.
//

import Foundation
import UIKit

// MARK: - Capitalizing

public extension String {
    
    public func capitalizedFirstLetter() -> String {
        guard let first = self.first else { return .empty }
        return String(first).uppercased() + dropFirst()
    }
    
    public mutating func capitalizeFirstLetter() {
        self = self.capitalizedFirstLetter()
    }
}
