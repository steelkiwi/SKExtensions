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
    /// - Parameter buttons:        List of buttons for displaying
    public func showAlert(title: String? = nil, message: String, buttons: Array<UIAlertAction>) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        buttons.forEach({ alert.addAction($0) })
        
        present(alert, animated: true, completion: nil)
    }
}
