//
//  String.swift
//
//
//  Created by Viktor Olesenko on 16.11.17.
//

import Foundation
import UIKit

// MARK: - Empty

public extension String {
    
    public static var empty: String { return "" }
    
    /// Empty check on string excluding whitespaces
    public var isBlank: Bool {
        return trimmingCharacters(in: .whitespaces).isEmpty
    }
}

// Extension on Optional type for empty check on unwrapped string
public extension Optional where Wrapped == String {
    
    public var isBlank: Bool {
        return self?.isBlank ?? true
    }
}
