//
//  Regex.swift
//
//  Created by Borys Khliebnikov on 3/22/17.
//  Copyright © 2017 Borys Khliebnikov. All rights reserved.
//

import Foundation

/// A simple regular expression type, supporting ^ and $ anchors,
/// and matching with . and *
public struct Regex {
    fileprivate let regexp: String
    /// Construct from a regular expression String
    public init(_ regexp: String) {
        self.regexp = regexp
    }
}

public extension Regex {
    /// Returns true if the string argument matches the expression.
    func match(_ text: String) -> Bool {
        // If the regex starts with ^, then it can only match the
        // start of the input
        
        let prefix = "^"
        if regexp.hasPrefix(prefix) {
            return Regex.matchHere(regexp: String(regexp.dropFirst(prefix.count)), text: text)
        }
        // Otherwise, search for a match at every point in the input
        // until one is found
        var idx = text.startIndex
        while true {
            if Regex.matchHere(regexp: regexp, text: String(text.suffix(from: idx))) {
                return true
            }
            guard idx != text.endIndex else { break }
            text.formIndex(after: &idx)
        }
        return false
    }
    
    /// Match a regular expression string at the beginning of text.
    fileprivate static func matchHere(regexp: String, text: String) -> Bool {
        // Empty regexprs match everything
        if regexp.isEmpty {
            return true
        }
        // Any character followed by * requires a call to matchStar
        if let c = regexp.first,
            regexp.dropFirst().first == "*" {
            return matchStar(character: c, regexp: String(regexp.dropFirst(2)), text: text)
        }
        // If this is the last regex character and it's $, then it's a match iff the
        // remaining text is also empty
        if regexp.first == "$" && regexp.dropFirst().isEmpty {
            return text.isEmpty
        }
        // If one character matches, drop one from the input and the regex
        // and keep matching
        if let tc = text.first, let rc = regexp.first, rc == "." || tc == rc {
            return matchHere(regexp: String(regexp.dropFirst()), text: String(text.dropFirst()))
        }
        // If none of the above, no match
        return false
    }
    
    /// Search for zero or more `c`'s at beginning of text, followed by the
    /// remainder of the regular expression.
    fileprivate static func matchStar(character c: Character, regexp: String, text: String) -> Bool {
        var idx = text.startIndex
        while true { // a * matches zero or more instances
            if matchHere(regexp: regexp, text: String(text.suffix(from: idx))) {
                return true
            }
            if idx == text.endIndex || (text[idx] != c && c != ".") {
                return false
            }
            text.formIndex(after: &idx)
        }
    }
}

extension Regex: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        regexp = value
    }
    public init(extendedGraphemeClusterLiteral value: String) {
        self = Regex(stringLiteral: value)
    }
    public init(unicodeScalarLiteral value: String) {
        self = Regex(stringLiteral: value)
    }
}

extension Regex: CustomStringConvertible {
    
    public var description: String {
        return "/\(regexp)/"
    }
}

