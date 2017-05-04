//
//  UITableView+CellRegister.swift
//  RDXT
//
//  Created by Viktor Olesenko on 04.05.17.
//  Copyright © 2017 Steelkiwi. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var identifier: String { return String(describing: self) }
}

extension UITableView {
    
    /// Register cell wrapper function
    /// Register passed cell class with class name as identifier
    /// 
    /// tableView.register(SubclassCell.self, forCellReuseIdentifier: identifier) -> tableView.register.register(SubclassCell.self, isNib: false)
    ///
    /// - Parameter cellClass:  UITableViewCell subclass class
    /// - Parameter isNib:      Is cell stored in .xib file or just in code. Default is true
    func register<T>(_ cellClass: T.Type, isNib: Bool = true) where T: UITableViewCell {
        if isNib {
            self.register(UINib(nibName: String(describing: T.classForCoder()), bundle: nil), forCellReuseIdentifier: T.identifier)
        } else {
            self.register(T.classForCoder(), forCellReuseIdentifier: T.identifier)
        }
    }
    
    
    /// Cell deque wrapper
    ///
    /// let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! SubclassCell -> let cell: SubclassCell = tv.dequeueReusableCell()
    ///
    /// - Returns: Dequed cell for passed as generic class. Can fail if cell not registered
    func dequeueReusableCell<T>() -> T where T: UITableViewCell {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.identifier) as? T else {
            assertionFailure("Cell \(T.classForCoder()) not registered in tableView")
            return T()
        }
        
        return cell
    }
}
