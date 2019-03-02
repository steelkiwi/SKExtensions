//
//  UIImage+Base64.swift
//  
//
//  Created by Viktor Olesenko on 03.07.18.
//  Copyright © 2018 Steelkiwi. All rights reserved.
//

import UIKit

public extension UIImage {
    
    public var base64EncodedString: String? {
        return self.pngData()?.base64EncodedString()
    }
    
    public convenience init?(base64EncodedString: String) {
        guard let data = Data.init(base64Encoded: base64EncodedString) else {
            return nil
        }
        
        self.init(data: data)
    }
}
