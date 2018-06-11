//
//  UIViewControllerExtension.swift
//
//  Created by Borys Khliebnikov on 11/04/17.
//  Copyright © 2017 Borys Khliebnikov. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    
    /// Detect if controller was presented
    public var isPresented: Bool {
        return (self.presentingViewController != nil || self.navigationController?.presentingViewController != nil)
    }
    
    /// Simple alert popup extension
    /// - Parameter title:          Alert title
    /// - Parameter message:        Alert message
    /// - Parameter buttonTitle:    Cancel action button title
    public func showAlert(title: String! = "", message: String!, buttonTitle: String! = "OK", handler: ((UIAlertAction) -> Void)? = nil) {
        let controller = UIAlertController.init(title: title,
                                                message: message,
                                                preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction.init(title: buttonTitle, style: UIAlertActionStyle.cancel, handler: handler)
        controller.addAction(action)
        present(controller, animated: true, completion: nil)
    }
    
    public func showAlert(title: String? = nil, message: String, buttons: Array<UIAlertAction>) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        buttons.forEach({ alert.addAction($0) })
        
        present(alert, animated: true, completion: nil)
    }
}