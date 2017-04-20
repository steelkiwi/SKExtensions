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
let kAnimationDurationDefault    : CGFloat = 0.35

// MARK: - Constraints

enum ConstraintPriority: UILayoutPriority {
    case low      = 250
    case normal   = 500
    case hight    = 750
    case required = 100
}

// MARK: - Types

/// Shorter. Allowed to use without import CoreLocation in every class
typealias Coordinates = CLLocationCoordinate2D

typealias JSON        = Dictionary<String, Any>

// MARK: - External sources


/// Load property from plist file for key
private func plistValue(forKey key: String) -> String? {
    let path = Bundle.main.path(forResource: "Info", ofType: "plist")!
    let dict = NSDictionary(contentsOfFile: path) as? Dictionary<String, Any>
    
    return dict?[key] as? String
}
