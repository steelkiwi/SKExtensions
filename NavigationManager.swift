//
//  NavigationManager.swift
//
//
//  Created by Viktor Olesenko on 01.02.17.
//  Copyright © 2017 Steelkiwi. All rights reserved.
//

import UIKit

class NavigationManager: NSObject {
    
    /// Change current presented controller
    /// Be carefull with replacing presented controllers!
    ///
    /// - Parameter controller: new controller for displaying
    class func setRootController(_ controller: UIViewController) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.window?.rootViewController?.view.endEditing(true)
        appDelegate.window?.rootViewController = controller
        appDelegate.window?.makeKeyAndVisible()
    }
}
