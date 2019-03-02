//
//  String.swift
//
//
//  Created by Viktor Olesenko on 16.11.17.
//

import Foundation
import UIKit

// MARK: - Substrings

public extension String {
    
    public func substring(to index: Int) -> String {
        guard self.endIndex.encodedOffset >= index else { return self }
        
        let endIndex = self.index(self.startIndex, offsetBy: index)
        return String(self[..<endIndex])
    }
    
    public func substring(from index: Int) -> String {
        guard index <= self.endIndex.encodedOffset else { return String.empty }
        
        let startIndex = self.index(self.startIndex, offsetBy: index)
        return String(self[startIndex...])
    }
}
