//
//  CATransition.swift
//
//  Created by Viktor Olesenko on 18.06.18.
//  Copyright © 2018 Steelkiwi. All rights reserved.
//

import UIKit

// MARK: - UINavigationController

public typealias CATransitionDirection = CATransitionSubtype

public extension UINavigationController {
    
    func addTransition(transitionType type: CATransitionType, transitionDirection direction: CATransitionDirection) {
        let transition = CATransition()
        transition.duration = 0.35
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = type
        transition.subtype = direction
        
        self.view.layer.add(transition, forKey: nil)
    }

    func pushViewControllerCustom(_ viewController: UIViewController) {
        self.addTransition(transitionType: .push, transitionDirection: .fromRight)
        self.pushViewController(viewController, animated: false)
    }
    
    func popViewControllerCustom() {
        self.addTransition(transitionType: .push, transitionDirection: .fromLeft)
        self.popViewController(animated: false)
    }
}
