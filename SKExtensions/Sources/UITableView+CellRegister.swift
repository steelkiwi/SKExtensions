//
//  UITableView+CellRegister.swift
//
//
//  Created by Viktor Olesenko on 04.05.17.
//  Copyright © 2017 Steelkiwi. All rights reserved.
//

import UIKit

public extension UITableViewCell {
    public static var identifier: String { return String(describing: self) }
}

public extension UITableView {
    
    /// Register cell wrapper function
    /// Register passed cell class with class name as identifier
    ///
    /// tableView.register(SubclassCell.self, forCellReuseIdentifier: identifier) -> tableView.register(SubclassCell.self, isNib: false, forCellReuseIdentifier: identifier)
    ///
    /// - Parameters:
    ///   - cellClass:  UITableViewCell subclass class
    ///   - isNib:      Is cell stored in .xib file or just in code. Default is true
    ///   - identifier: The reuse identifier to associate with the specified nib file. Default value is `identifier` property.
    public func register<T>(_ cellClass: T.Type, isNib: Bool = true, forCellReuseIdentifier identifier: String = T.identifier) where T: UITableViewCell {
        if isNib {
            self.register(UINib(nibName: String(describing: T.classForCoder()), bundle: nil), forCellReuseIdentifier: identifier)
        } else {
            self.register(T.classForCoder(), forCellReuseIdentifier: identifier)
        }
    }
    
    
    /// Cell deque wrapper
    ///
    /// let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! SubclassCell -> let cell: SubclassCell = tv.dequeueReusableCell(withIdentifier: identifier)
    ///
    /// - Parameters:
    ///   - identifier: The reuse identifier to associate with the specified nib file. Default value is `identifier` property.
    /// - Returns: Dequed cell for passed as generic class. Can fail if cell not registered
    public func dequeueReusableCell<T>(withIdentifier identifier: String = T.identifier) -> T where T: UITableViewCell {
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? T else {
            assertionFailure("Cell \(T.classForCoder()) not registered in tableView")
            return T()
        }
        
        return cell
    }
}
