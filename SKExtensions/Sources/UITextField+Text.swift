//
//  UITextField.swift
//  
//
//  Created by Viktor Olesenko on 20.11.17.
//

import UIKit

public extension UITextField {
    
    public var textWrapped: String {
        return self.text ?? ""
    }
    
    public var isEmpty: Bool {
        guard let text = self.text else { return true }
        
        return text.isEmpty
    }
}
