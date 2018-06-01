//
//  UIView.swift
//  Wod
//
//  Created by Viktor Olesenko on 16.11.17.
//

import UIKit

// MARK: - Borders

extension UIView {
    
    @IBInspectable
    var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable
    var borderColor: UIColor {
        get { return UIColor.init(cgColor: layer.borderColor!) }
        set { layer.borderColor = newValue.cgColor }
    }
}
