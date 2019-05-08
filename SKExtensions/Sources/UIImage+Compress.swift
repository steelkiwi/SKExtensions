//
//  UIImage+Compress.swift
//  
//
//  Created by Viktor Olesenko on 11.07.18.
//  Copyright © 2018 Steelkiwi. All rights reserved.
//

import UIKit

public extension UIImage {
    
    // MARK: - Size info
    
    var sizeBytes: Int? {
        return self.jpegData(compressionQuality: 1)?.count
    }
    
    var sizeMB: CGFloat? {
        guard let sizeBytes = sizeBytes else { return nil }
        
        return CGFloat(sizeBytes) / 1024 / 1024
    }
    
    // MARK: - Compress
    
    func compress(to bytesSize: Int, step: CGFloat = 0.1) -> UIImage {
        var compression: CGFloat = 1
        
        while compression > 0 {
            guard let data = self.jpegData(compressionQuality: compression),
                let compressed = UIImage.init(data: data),
                let compressedSize = compressed.sizeBytes,
                compressedSize < bytesSize else {
                    compression -= step
                    continue
            }
            
            return compressed
        }
        
        print("Image Compression - Failed to compress image with passed parameters")
        
        let data = self.jpegData(compressionQuality: step)!
        return UIImage.init(data: data)!
    }
    
    func compress(to frameLimit: CGSize) -> UIImage? {
        // Don't compress if image size smaller than frameSize
        guard self.size.width > frameLimit.width ||
            self.size.height > frameLimit.height else {
                return self
        }        
        
        let ratioW = self.size.width  / frameLimit.width
        let ratioH = self.size.height / frameLimit.height
        
        let scale = max(ratioW, ratioH)
        
        let newW = self.size.width  / scale
        let newH = self.size.height / scale
        
        let newSize = CGSize.init(width: newW, height: newH)
        
        UIGraphicsBeginImageContext(newSize)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: newSize))
        
        guard let scaled = UIGraphicsGetImageFromCurrentImageContext() else {
            print("Image Compression - Failed to compress image to passed size")
            return nil
        }
        
        return scaled
    }
}
