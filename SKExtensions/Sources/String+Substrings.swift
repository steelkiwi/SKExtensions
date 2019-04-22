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
    
    func substring(to index: Int) -> String {
        guard self.endIndex.utf16Offset(in: self) >= index else { return self }
        
        let endIndex = self.index(self.startIndex, offsetBy: index)
        return String(self[..<endIndex])
    }
    
    func substring(from index: Int) -> String {
        guard index <= self.endIndex.utf16Offset(in: self) else { return String.empty }
        
        let startIndex = self.index(self.startIndex, offsetBy: index)
        return String(self[startIndex...])
    }
}
