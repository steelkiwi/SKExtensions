//
//  UIStackView+Subviews.swift
//  
//
//  Created by Viktor Olesenko on 28.11.19.
//

import UIKit

extension UIStackView {
    
    // https://gist.github.com/Deub27/5eadbf1b77ce28abd9b630eadb95c1e2#gistcomment-2818687
    @discardableResult
    func removeAllArrangedSubviews() -> [UIView] {
            let removedSubviews = arrangedSubviews.reduce([]) { (removedSubviews, subview) -> [UIView] in
                self.removeArrangedSubview(subview)
                NSLayoutConstraint.deactivate(subview.constraints)
                subview.removeFromSuperview()
                return removedSubviews + [subview]
            }
            return removedSubviews
        }
}
