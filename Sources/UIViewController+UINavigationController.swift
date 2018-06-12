//
//  UIViewController+UINavigationController.swift
//
//
//  Created by Viktor Olesenko on 11.06.18.
//

import UIKit

public extension UIViewController {
    
    public func removeBackButtonTitle() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .plain, target: nil, action: nil)
    }
    
    public func wrappedInNC() -> UINavigationController {
        let nc = UINavigationController.init(rootViewController: self)
        
        return nc
    }
}
