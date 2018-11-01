//
//  UISearchBar.swift
//  
//
//  Created by Viktor Olesenko on 11.07.18.
//  Copyright © 2018 Steelkiwi. All rights reserved.
//

import UIKit

public extension UISearchBar {
    
    public var cancelButton: UIButton? {
        guard self.showsCancelButton else { return nil }
        
        return self.subviews.first?.subviews.first(where: { $0 is UIButton }) as? UIButton
    }
}
