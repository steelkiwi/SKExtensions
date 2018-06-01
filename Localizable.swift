//
//  Localizable.swift
//  LocaliseTest
//
//  Created by Viktor Olesenko on 01.11.17.
//  Copyright © 2017 Viktor Olesenko. All rights reserved.
//

import UIKit

extension String {
    
    /// Get self as key and return related localized value
    ///
    /// - Parameter tableName: .strings file name
    /// - Returns: localized value if found. Key (self) otherwise
    func localized(tableName: String? = nil) -> String {
        return NSLocalizedString("\(self)", tableName: tableName, comment: "") // Wrapped self into string for localization export support
    }
}

protocol Localizable {
    
    /// Key for localization value
    var localizationKey:  String? { get set }
    
    /// Name of localization file. Set nil for default 'Localizable.strings'
    var localizationFile: String? { get set }
}

fileprivate extension UIView {

    /// Link and save passed string to 'self' with key
    func setStored(string: String?, key: UnsafePointer<UInt8>) {
        objc_setAssociatedObject(self, key, string, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    /// Get saved string from 'self' for key
    func getStored(key: UnsafePointer<UInt8>) -> String? {
        return objc_getAssociatedObject(self, key) as? String
    }
}

// MARK: - Define localization file

private var associatedKeyTable: UInt8 = 0

extension UIView {
  
    // Set as @IBInspectable if you use separated .strings files and want to define them in storyboard
    /// Name of .strings file
    var localizationFile: String? {
        get { return self.getStored(key: &associatedKeyTable) }
        set {
            self.setStored(string: newValue, key: &associatedKeyTable)
            if var localSelf = self as? Localizable {
                localSelf.localizationKey = localSelf.localizationKey
            }
            
        }
    }
}

// MARK: - Localized UIComponents

private var associatedKeyText:        UInt8 = 1
private var associatedKeyPlaceholder: UInt8 = 2

extension UILabel: Localizable {
    
    @IBInspectable
    var localizationKey: String? {
        get { return self.getStored(key: &associatedKeyText) }
        set {
            self.setStored(string: newValue, key: &associatedKeyText)
            
            self.text = newValue?.localized(tableName: self.localizationFile)
        }
    }
}

extension UIButton {
    
    @IBInspectable
    var localizationKey: String? {
        get { return self.getStored(key: &associatedKeyText) }
        set {
            self.setStored(string: newValue, key: &associatedKeyText)
            
            self.setTitle(newValue?.localized(tableName: self.localizationFile), for: .normal)
        }
    }
}

extension UITextField {
    
    @IBInspectable
    var localizationKey: String? {
        get { return self.getStored(key: &associatedKeyText) }
        set {
            self.setStored(string: newValue, key: &associatedKeyText)
            
            self.text = newValue?.localized(tableName: self.localizationFile)
        }
    }
    
    @IBInspectable
    var localizationPlaceholderKey: String? {
        get { return self.getStored(key: &associatedKeyPlaceholder) }
        set {
            self.setStored(string: newValue, key: &associatedKeyPlaceholder)
            
            self.placeholder = newValue?.localized(tableName: self.localizationFile)
        }
    }
}
