//
//  UITabBar+Index.swift
//
//
//  Created by Viktor Olesenko on 23.07.18.
//  Copyright © 2018 Steelkiwi. All rights reserved.
//

import UIKit

public extension UITabBar {
    
    public var selectedIndex: Int? {
        get {
            guard let items = self.items,
                let selected = self.selectedItem,
                let index = items.index(of: selected) else {
                    return nil
            }
            
            return index
        }
        
        set {
            guard let newIndex = newValue,
                let items = self.items,
                newIndex < items.count else {
                    self.selectedItem = nil
                    return
            }
            
            self.selectedItem = items[newIndex]
        }
    }
}
