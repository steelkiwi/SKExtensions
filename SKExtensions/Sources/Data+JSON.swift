//
//  Data.swift
//
//
//  Created by Viktor Olesenko on 22.11.17.
//

import Foundation

public extension Data {
    
    public var json: Dictionary<String, Any>? {
        return (try? JSONSerialization.jsonObject(with: self, options: .allowFragments)) as? Dictionary<String, Any>
    }
}
