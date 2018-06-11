//
//  UIView.swift
//  Wod
//
//  Created by Viktor Olesenko on 16.11.17.
//

import UIKit

// MARK: - Borders

public extension UIView {
    
    @IBInspectable
    public var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable
    public var borderColor: UIColor {
        get { return UIColor.init(cgColor: layer.borderColor!) }
        set { layer.borderColor = newValue.cgColor }
    }
}
