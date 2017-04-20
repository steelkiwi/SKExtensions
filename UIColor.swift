//
//  UIColor.swift
//  
//
//  Created by Viktor Olesenko on 20.04.17.
//
//

import UIKit

extension UIColor {
    
    // MARK: - Constructors
    
    convenience init(hex: Int) {
        self.init(red: (hex >> 16) & 0xff, green: (hex >> 8) & 0xff, blue: hex & 0xff)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
}
