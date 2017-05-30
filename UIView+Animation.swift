//
//  UIView+Animation.swift
//  
//
//  Created by Viktor Olesenko on 30.05.17.
//
//

import UIKit

let kAnimationDurationDefault: Double = 0.35

extension UIView {
    
    open class func animate(animations: @escaping () -> Swift.Void) {
        self.animate(withDuration: kAnimationDurationDefault, animations: animations)
    }
}
