//
//  String.swift
//
//
//  Created by Viktor Olesenko on 16.11.17.
//

import Foundation
import UIKit

// MARK: - Capitalizing

extension String {
    
    func capitalizedFirstLetter() -> String {
        guard let first = self.first else { return .empty }
        return String(first).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizedFirstLetter()
    }
}
