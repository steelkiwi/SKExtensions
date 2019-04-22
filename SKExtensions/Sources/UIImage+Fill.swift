//
//  UIImage+Fill.swift
//  
//
//  Created by Viktor Olesenko on 20.07.18.
//  Copyright © 2018 Steelkiwi. All rights reserved.
//

import UIKit

public extension UIImage {
    
    convenience init?(color: UIColor, size: CGSize = CGSize.init(width: 1, height: 1), isRound: Bool = false) {
        let rect = CGRect.init(origin: .zero, size: size)
        
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        
        if isRound {
            context?.fillEllipse(in: rect)
        } else {
            context?.fill(rect)
        }
        
        let imageFromContext = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let image = imageFromContext,
            let cgImage = image.cgImage else {
                return nil
        }
        
        self.init(cgImage: cgImage)
    }
}
