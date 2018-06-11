//
//  UIView.swift
//  Wod
//
//  Created by Viktor Olesenko on 16.11.17.
//

import UIKit

// MARK: - Corners

public extension UIView {
    
    private var halfHeight: CGFloat { return self.bounds.height / 2 }
    
    @IBInspectable
    public var isRound: Bool {
        get { return self.cornerRadius == halfHeight }
        set { self.cornerRadius = halfHeight }
    }
    
    @IBInspectable
    public var cornerRadius: CGFloat {
        get { return self.layer.cornerRadius }
        set {
            self.layer.masksToBounds = newValue != 0
            self.layer.cornerRadius  = newValue
        }
    }
}
