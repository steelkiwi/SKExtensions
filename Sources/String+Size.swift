//
//  String.swift
//  
//
//  Created by Viktor Olesenko on 16.11.17.
//

import Foundation
import UIKit

// MARK: - Size

public extension String {
    
    /// Calculate string height with passed params
    ///
    /// - Parameters:
    ///   - width: label width
    ///   - font: label font
    /// - Returns: required height for label with passed width, font and text
    public func requiredHeight(width: CGFloat, font: UIFont) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = font
        label.text = self
        
        label.sizeToFit()
        
        return label.bounds.height
    }
    
    /// Calculate string width with passed params
    ///
    /// - Parameters:
    ///   - width: label width
    ///   - font: label font
    /// - Returns: required height for label with passed width, font and text
    public func requiredWidth(font: UIFont) -> CGFloat {
        let label = UILabel()
        label.font = font
        label.text = self
        
        label.sizeToFit()
        
        return label.bounds.width
    }
}
