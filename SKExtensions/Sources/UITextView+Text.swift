//
//  UITextView+Text.swift
//
//  Created by Viktor Olesenko on 22.08.18.
//  Copyright © 2018 Steelkiwi. All rights reserved.
//

import UIKit

public extension UITextView {
    
    var textWrapped: String {
        return self.text ?? ""
    }
    
    var isEmpty: Bool {
        guard let text = self.text else { return true }
        
        return text.isEmpty
    }
}
