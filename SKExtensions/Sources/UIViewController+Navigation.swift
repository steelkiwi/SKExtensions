//
//  UIViewController+Navigation.swift
//  
//
//  Created by Viktor Olesenko on 22.06.20.
//

import UIKit

public extension UIViewController {
    
    /// Detect if controller was pushed from prev VC
    var isPushed: Bool {
        guard let navigationController = navigationController else { return false }
        
        return navigationController.viewControllers.before(self) != nil
    }
    
    /// Detect if controller was presented
    var isPresented: Bool {
        return (self.presentingViewController != nil || self.navigationController?.presentingViewController != nil)
    }
}
