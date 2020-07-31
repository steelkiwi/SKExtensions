//
//  UINavigationController.swift
//  
//
//  Created by Viktor Olesenko on 15.06.18.
//  Copyright © 2018 Steelkiwi. All rights reserved.
//

import UIKit

public extension UINavigationController {
    
    func replace(vc oldVC: UIViewController, with newVC: UIViewController, duration: TimeInterval = 0.35, animationOptions: UIView.AnimationOptions? = nil, completion: ((Bool) -> Void)? = nil) {
        DispatchQueue.main.async {
            guard let index = self.viewControllers.firstIndex(of: oldVC) else { return }
            
            self.viewControllers[index] = newVC
            
            if let animationOptions = animationOptions {
                UIView.transition(from: oldVC.view, to: newVC.view, duration: duration, options: animationOptions, completion: completion)
            }
        }
    }
}
