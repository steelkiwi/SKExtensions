//
//
//  Created by Viktor Olesenko on 09.12.19.
//  Copyright © 2017 Steelkiwi. All rights reserved.
//

import UIKit

public extension UITableViewHeaderFooterView {
    static var identifier: String { return String(describing: self) }
}

public extension UITableView {
        
    /// Register header footer view wrapper function
    /// Register passed view class with class name as identifier
    ///
    /// tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: identifier) -> tableView.register(UITableViewHeaderFooterView.self, isNib: false, forIdentifier: identifier)
    ///
    /// - Parameters:
    ///   - class:      UITableViewHeaderFooterView subclass class
    ///   - isNib:      Is view stored in .xib file or just in code. Default is true
    ///   - identifier: The reuse identifier to associate with the specified nib file. Default value is `identifier` property.
    func registerView<T>(_ class: T.Type, isNib: Bool = true, forIdentifier identifier: String = T.identifier) where T: UITableViewHeaderFooterView {
        if isNib {
            self.register(UINib(nibName: String(describing: T.classForCoder()), bundle: nil), forHeaderFooterViewReuseIdentifier: identifier)
        } else {
            self.register(T.classForCoder(), forHeaderFooterViewReuseIdentifier: identifier)
        }
    }
    
    /// View deque wrapper
    ///
    /// let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier) as! UITableViewHeaderFooterView -> let view: UITableViewHeaderFooterView = tv.dequeueReusableView()
    ///
    /// - Parameters:
    ///   - identifier: The reuse identifier to associate with the specified nib file. Default value is `identifier` property.
    /// - Returns: Dequed view for passed as generic class. Can fail if view not registered
    func dequeueReusableView<T>(withIdentifier identifier: String = T.identifier) -> T where T: UITableViewHeaderFooterView {
        guard let view = self.dequeueReusableHeaderFooterView(withIdentifier: identifier) as? T else {
            assertionFailure("View \(T.classForCoder()) not registered in tableView")
            return T()
        }
        
        return view
    }
}
