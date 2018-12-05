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
    
    /// Detect if viewController is on the screen
    public var isVisible: Bool {
        return self.viewIfLoaded?.window != nil
    }
    
    /// Dismiss viewController (if exist), presented from self
    public func dismissPresentedVC(animated: Bool = true, completion: (() -> Void)? = nil) {
        self.presentedViewController?.dismiss(animated: animated, completion: completion)
    }
}
