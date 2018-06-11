//
//  UIView+Animation.swift
//  
//
//  Created by Viktor Olesenko on 30.05.17.
//
//

import UIKit

let kAnimationDurationDefault: Double = 0.35

public extension UIView {
    
    public class func animate(animations: @escaping () -> Swift.Void) {
        self.animate(withDuration: kAnimationDurationDefault, animations: animations)
    }
}