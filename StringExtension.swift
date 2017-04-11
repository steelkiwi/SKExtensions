//
//  StringExtension.swift
//
//  Created by Borys Khliebnikov on 3/22/17.
//  Copyright © 2017 Borys Khliebnikov. All rights reserved.
//

import Foundation

extension String {
    
    
    /// Split string to words
    ///
    /// - Parameter charset: patricular character set for words
    /// - Returns: array of words
    func words(with charset: CharacterSet = .alphanumerics) -> [String] {
        return self.unicodeScalars.split {
            !charset.contains($0)
            }.map(String.init)
    }
    
    
    /// Characters count on string
    var length: Int {
        return characters.count
    }
    
    
    /// Check on email regex
    ///
    /// - Returns: true or false
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return Regex.init(emailRegEx).match(self)
    }

    
    /// Empty check on string excluding whitespaces
    var isBlank: Bool {
        return trimmingCharacters(in: .whitespaces).isEmpty
    }
    
}

@available(swift 3.1)
// MARK: - Extension on Optional type for empty check on unwrapped string
extension Optional where Wrapped == String {
    var isBlank: Bool {
        return self?.isBlank ?? true
    }
}

