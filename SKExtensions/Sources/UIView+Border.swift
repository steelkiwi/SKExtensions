//
//  UIView.swift
//  
//
//  Created by Viktor Olesenko on 16.11.17.
//

import UIKit

// MARK: - Borders

extension UIView {
    
    @IBInspectable
    open var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable
    open var borderColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else { return nil }
            return UIColor.init(cgColor: cgColor)
        }
        set { layer.borderColor = newValue?.cgColor }
    }
}
