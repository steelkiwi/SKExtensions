//
//  UIViewController+UIStatusBar.swift
//
//
//  Created by Viktor Olesenko on 11.06.18.
//

import UIKit

public extension UIViewController {
    
    public var statusBarStyle: UIStatusBarStyle {
        get { return UIApplication.shared.statusBarStyle }
        set {
            UIApplication.shared.statusBarStyle = newValue
            setNeedsStatusBarAppearanceUpdate()
        }
    }
}
