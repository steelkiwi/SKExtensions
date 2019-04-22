//
//  UIView+Animation.swift
//  
//
//  Created by Viktor Olesenko on 30.05.17.
//
//

import UIKit

public let kAnimationDurationDefault: Double = 0.35

public extension UIView {
    
    class func animate(animations: @escaping () -> Swift.Void) {
        self.animate(withDuration: kAnimationDurationDefault, animations: animations)
    }
}
