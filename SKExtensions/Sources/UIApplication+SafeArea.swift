//
//  UIApplication+SafeArea.swift
//  
//
//  Created by Viktor Olesenko on 14.03.20.
//

import UIKit

extension UIApplication {
    
    var safeAreaInsets: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return keyWindow?.safeAreaInsets ??
                windows.first?.safeAreaInsets ??
                delegate?.window??.safeAreaInsets ??
                .zero
        } else {
            return .zero
        }
    }
}
