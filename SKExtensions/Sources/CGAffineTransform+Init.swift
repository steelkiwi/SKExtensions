//
//  CGAffineTransform.swift
//  
//
//  Created by Viktor Olesenko on 25.10.17.
//  Copyright © 2017 Viktor Olesenko. All rights reserved.
//

import Foundation
import CoreGraphics

public extension CGAffineTransform {
        
    init(scale: CGFloat) {
        self.init(scaleX: scale, y: scale)
    }
    
    init(rotationDegrees degrees: CGFloat) {
        let radians = degrees * .pi / 180
        self.init(rotationAngle: radians)
    }
}
