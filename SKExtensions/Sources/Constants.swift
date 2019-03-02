//
//  Constants.swift
//  Common used constants and typedefs
//
//  Created by Viktor Olesenko on 20.04.17.
//
//

import Foundation
import UIKit
import CoreLocation

// MARK: - Constants

let UITableViewCellHeightDefault : CGFloat = 44

// MARK: - Types

/// Shorter. Allowed to use without import CoreLocation in every class
typealias Coordinates = CLLocationCoordinate2D

typealias JSON        = Dictionary<String, Any>

// MARK: - External sources


/// Load property from plist file for key
private func infoPlistValue(forKey key: String) -> String? {
    if let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
        let dict = NSDictionary(contentsOfFile: path) as? Dictionary<String, Any>,
        let value = dict[key] as? String {
        return value
    }
    
    return nil
}
