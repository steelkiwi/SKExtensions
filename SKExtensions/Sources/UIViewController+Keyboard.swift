//
//  UIViewController+Keyboard.swift
//
//
//  Created by Viktor Olesenko on 25.02.19.
//  Copyright © 2019 Steelkiwi. All rights reserved.
//

import UIKit

extension UIViewController {
    
    public func subscribeKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    public func unsubscribeKeyboard() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func keyboardHeight(_ notification: NSNotification) -> CGFloat {
        guard let userInfo = notification.userInfo,
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
                return 0
        }
        
        // Detect keyboard start position for current active VC. Also takes into account safe area and child VC insets        
        let keyboardY = UIApplication.shared.keyWindow!.convert(keyboardFrame.origin, to: self.view).y
        let kbHeight = self.view.bounds.height - keyboardY
        
        return kbHeight
    }
    
    @objc
    private func keyboardWillShow(_ notification: NSNotification) {
        // Handle kb opening only if app is active
        guard UIApplication.shared.applicationState == .active else { return }
        
        let bottomOffset = keyboardHeight(notification)
        setBottomOffsetForKeyboard(bottomOffset)
    }
    
    @objc
    private func keyboardWillHide(_ notification: NSNotification) {
        setBottomOffsetForKeyboard(0)
    }
    
    @objc
    open func setBottomOffsetForKeyboard(_ newValue: CGFloat) {
        let bottomConstraint = self.view.constraints(for: .bottom).filter({
            if #available(iOS 11.0, *) {
                return $0.firstItem === self.view.safeAreaLayoutGuide || $0.secondItem === self.view.safeAreaLayoutGuide
            } else {
                return $0.firstItem === self.bottomLayoutGuide || $0.secondItem === self.bottomLayoutGuide
            }
        }).first
        
        if #available(iOS 11.0, *) {
            bottomConstraint?.constant = bottomConstraint?.firstItem === self.view.safeAreaLayoutGuide ? -newValue : newValue
        } else {
            bottomConstraint?.constant = bottomConstraint?.firstItem === self.bottomLayoutGuide ? -newValue : newValue
        }
        animateLayoutForKeyboard()
    }
    
    private func animateLayoutForKeyboard() {
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
}

fileprivate extension UIView {
    
    func constraints(for attribute: NSLayoutConstraint.Attribute) -> Array<NSLayoutConstraint> {
        
        return self.constraints.filter({
            return ($0.firstItem === self && $0.firstAttribute == attribute) ||
                ($0.secondItem === self && $0.secondAttribute == attribute)
        })
    }
}
