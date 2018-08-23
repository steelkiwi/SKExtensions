//
//  Localizable.swift
//  LocaliseTest
//
//  Created by Viktor Olesenko on 01.11.17.
//  Copyright © 2017 Viktor Olesenko. All rights reserved.
//

import UIKit

public extension String {
    
    /// Get self as key and return related localized value
    ///
    /// - Parameter tableName: .strings file name
    /// - Returns: localized value if found. Key (self) otherwise
    public func localized(tableName: String? = nil, arguments: JSON? = nil) -> String {
        
        var localizedValue = NSLocalizedString("\(self)", tableName: tableName, comment: "") // Wrapped self into string for localization export support
        
        if let arguments = arguments {
            for key in arguments.keys {
                let value = String.init(describing: arguments[key]!)
                localizedValue = localizedValue.replacingOccurrences(of: "$(\(key))", with: value)
            }
        }
        
        return localizedValue
    }
    
    public func localizedPlural(value: Int) -> String {
        return String.localizedStringWithFormat(self.localized(), value)
    }
}

public protocol Localizable {
    
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

public extension UIView {
  
    // Set as @IBInspectable if you use separated .strings files and want to define them in storyboard
    /// Name of .strings file
    public var localizationFile: String? {
        get { return self.getStored(key: &associatedKeyTable) }
        set {
            self.setStored(string: newValue, key: &associatedKeyTable)
            if let localSelf = self as? Localizable {
                var varSelf = localSelf
                varSelf.localizationKey = localSelf.localizationKey
            }            
        }
    }
}

// MARK: - Localized UIComponents

private var associatedKeyText:        UInt8 = 1
private var associatedKeyPlaceholder: UInt8 = 2

public extension UILabel {
    
    @IBInspectable
    public var localizationKey: String? {
        get { return self.getStored(key: &associatedKeyText) }
        set {
            self.setStored(string: newValue, key: &associatedKeyText)
            
            self.text = newValue?.localized(tableName: self.localizationFile)
        }
    }
}

public extension UIButton {
    
    @IBInspectable
    public var localizationKey: String? {
        get { return self.getStored(key: &associatedKeyText) }
        set {
            self.setStored(string: newValue, key: &associatedKeyText)
            
            self.setTitle(newValue?.localized(tableName: self.localizationFile), for: .normal)
        }
    }
}

public extension UITextField {
    
    @IBInspectable
    public var localizationKey: String? {
        get { return self.getStored(key: &associatedKeyText) }
        set {
            self.setStored(string: newValue, key: &associatedKeyText)
            
            self.text = newValue?.localized(tableName: self.localizationFile)
        }
    }
    
    @IBInspectable
    public var localizationPlaceholderKey: String? {
        get { return self.getStored(key: &associatedKeyPlaceholder) }
        set {
            self.setStored(string: newValue, key: &associatedKeyPlaceholder)
            
            self.placeholder = newValue?.localized(tableName: self.localizationFile)
        }
    }
}
