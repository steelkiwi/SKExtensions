//
//  String.swift
//
//
//  Created by Viktor Olesenko on 16.11.17.
//

import Foundation
import UIKit

// MARK: - Filter

public extension String {
    
    public func clean(accordingTo set: CharacterSet) -> String {
        return self.filter { String($0).rangeOfCharacter(from: set.inverted) == nil }
    }
}
