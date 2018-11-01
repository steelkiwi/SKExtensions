//
//  UIViewController.swift
//
//
//  Created by Viktor Olesenko on 11.06.18.
//

import UIKit

public extension UIViewController {
    
    public static var identifier: String { return String(describing: self) }
    
    // MARK: - Keyboard
    
    @objc
    public func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    // MARK: - Navigation
    
    public func dismissPresentedVC(animated: Bool = true, completion: (() -> Void)? = nil) {
        self.presentedViewController?.dismiss(animated: animated, completion: completion)
    }
}
