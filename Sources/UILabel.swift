//
//  UILabel.swift
//  
//
//  Created by Viktor Olesenko on 20.04.17.
//
//

import Foundation
import UIKit

public extension UILabel {
    
    var requiredHeight: CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = self.numberOfLines
        label.lineBreakMode = self.lineBreakMode
        label.font = self.font
        label.text = self.text
        
        label.sizeToFit()
        
        return label.bounds.height
    }
}
