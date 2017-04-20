//
//  StringExtension.swift
//
//  Created by Borys Khliebnikov on 3/22/17.
//  Copyright © 2017 Borys Khliebnikov. All rights reserved.
//

import Foundation

extension String {
    
    /// Empty string bind to avoid red quotes in code
    static var empty: String { return "" }
    
    /// Detect if string contains only numeric characters
    var isNumber: Bool {
        let numberSet = NSCharacterSet.decimalDigits.inverted
        return !self.isEmpty && self.rangeOfCharacter(from: numberSet) == nil
    }
    
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
    
    /// Calculate string height with passed params
    ///
    /// - Parameters:
    ///   - width: label width
    ///   - font: label font
    /// - Returns: required height for label with passed width, font and text
    func requiredHeight(width: CGFloat, font: UIFont) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = font
        label.text = self
        
        label.sizeToFit()
        
        return label.bounds.height
    }
}

// MARK: - Capitalization

extension String {
    
    func capitalizedFirstLetter() -> String {
        let first = String(characters.prefix(1)).capitalized
        let other = String(characters.dropFirst())
        return first + other
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizedFirstLetter()
    }
}

// MARK: - Ranges

extension String {
    
    /// Converd Obj-C NSRange to new Range.
    /// IMPORTANT! may not work correct with utf-16 strings. Should use NSRange toRange() method in this case
    ///
    /// - Parameter nsrange: old NSRange
    /// - Returns: range converted to new Range class
    func range(from nsrange: NSRange) -> Range<String.Index> {
        let startIndex = self.index(self.startIndex, offsetBy: nsrange.location)
        let endIndex = self.index(startIndex, offsetBy: nsrange.length)
        
        let range: Range<String.Index> = startIndex..<endIndex
        
        return range
    }
    
    func substring(from: Int) -> String {
        return self.substring(from: self.index(self.startIndex, offsetBy: from))
    }
    
    func substring(to: Int) -> String {
        return self.substring(to: self.index(self.startIndex, offsetBy: to))
    }
}

// MARK: - Validation

extension String {
    
    /// Empty check on string excluding whitespaces
    var isBlank: Bool {
        return trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    /// Check on email regex
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return Regex.init(emailRegEx).match(self)
    }
}

@available(swift 3.1)

// Extension on Optional type for empty check on unwrapped string
extension Optional where Wrapped == String {
    var isBlank: Bool {
        return self?.isBlank ?? true
    }
}

