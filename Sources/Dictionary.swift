//
//  Dictionary.swift
//  
//
//  Created by Viktor Olesenko on 20.04.17.
//
//

import UIKit

func +<Key, Value>(left: Dictionary<Key, Value>, right: Dictionary<Key, Value>) -> Dictionary<Key, Value> {
    
    var result = left
    right.forEach{ result[$0] = $1 }
    
    return result
}
