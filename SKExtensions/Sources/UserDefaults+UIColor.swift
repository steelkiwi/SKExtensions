//
//  UserDefaults+UIColor.swift
//  Gotribe
//
//  Created by Viktor Olesenko on 30.07.19.
//

import UIKit

@available(iOS 11.0, *)
extension UserDefaults {
    
    func color(forKey key: String) -> UIColor? {
        guard let data = data(forKey: key) else { return nil }
        
        return (try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)) as? UIColor
    }
    
    func set(_ color: UIColor?, forKey key: String) {
        var data: Data?
        
        if let color = color,
            let archivedData = try? NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false) {
            data = archivedData
        }
        
        self.set(data, forKey: key)
    }
}
