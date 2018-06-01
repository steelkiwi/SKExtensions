//
//  UIView.swift
//  Wod
//
//  Created by Viktor Olesenko on 16.11.17.
//

import UIKit

// MARK: - Subview

extension UIView {
    
    var siblings: [UIView]? {
        if let stackView = superview as? UIStackView { return stackView.arrangedSubviews }
        
        return superview?.subviews
    }
    
    func addSubviewWithConstraints(_ view: UIView, insets: UIEdgeInsets = .zero) {
        self.addSubviewWithConstraints(view, top: insets.top, left: insets.left, bottom: insets.bottom, right: insets.right)
    }
    
    func addSubviewWithConstraints(_ view: UIView, top: CGFloat? = nil, left: CGFloat? = nil, bottom: CGFloat? = nil, right: CGFloat? = nil) {
        self.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top        { view.topAnchor.constraint(equalTo: self.topAnchor, constant: top).isActive = true }
        if let left = left      { view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: left).isActive = true }
        if let bottom = bottom  { view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -bottom).isActive = true }
        if let right = right    { view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -right).isActive = true }
    }
    
    var viewContentSize: CGSize {
        guard subviews.isEmpty == false,
            let minX = subviews.map({ $0.frame.minX }).min(),
            let maxX = subviews.map({ $0.frame.maxX }).max(),
            let minY = subviews.map({ $0.frame.minY }).min(),
            let maxY = subviews.map({ $0.frame.maxY }).max() else {
                return self.bounds.size
        }
        
        return CGSize.init(width: maxX - minX, height: maxY - minY)
    }
}
