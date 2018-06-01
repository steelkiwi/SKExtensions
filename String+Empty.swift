//
//  String.swift
//
//
//  Created by Viktor Olesenko on 16.11.17.
//

import Foundation
import UIKit

// MARK: - Empty

extension String {
    
    static var empty: String { return "" }
    
    /// Empty check on string excluding whitespaces
    var isBlank: Bool {
        return trimmingCharacters(in: .whitespaces).isEmpty
    }
}

// Extension on Optional type for empty check on unwrapped string
extension Optional where Wrapped == String {
    
    var isBlank: Bool {
        return self?.isBlank ?? true
    }
}
