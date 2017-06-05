//
//  UICollectionView+CellRegister.swift
//  
//
//  Created by Viktor Olesenko on 05.06.17.
//  Copyright © 2017 Steelkiwi. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    static var identifier: String { return String(describing: self) }
}

extension UICollectionView {
    
    /// Register cell wrapper function
    /// Register passed cell class with class name as identifier
    ///
    /// collectionView.register(SubclassCell.self, forCellWithReuseIdentifier: identifier) -> collectionView.register(SubclassCell.self, isNib: false)
    ///
    /// - Parameters:
    ///   - cellClass:  UITableViewCell subclass class
    ///   - isNib:      Is cell stored in .xib file or just in code. Default is true
    ///   - identifier: The reuse identifier to associate with the specified nib file. Default value is `identifier` property.
    func register<T>(_ cellClass: T.Type, isNib: Bool = true, forCellWithReuseIdentifier identifier: String = T.identifier) where T: UICollectionViewCell {
        if isNib {
            self.register(UINib(nibName: String(describing: T.classForCoder()), bundle: nil), forCellWithReuseIdentifier: identifier)
        } else {
            self.register(T.classForCoder(), forCellWithReuseIdentifier: T.identifier)
        }
    }
    
    
    /// Cell deque wrapper
    ///
    /// let cell = tableView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! SubclassCell -> let cell: SubclassCell = tv.dequeueReusableCell(for: indexPath)
    ///
    /// - Parameters:
    ///   - identifier: The reuse identifier to associate with the specified nib file. Default value is `identifier` property.
    ///   - indexPath: The index path specifying the location of the cell. The data source receives this information when it is asked for the cell and should just pass it along. This method uses the index path to perform additional configuration based on the cell’s position in the collection view.
    /// - Returns: Dequed cell for passed as generic class. Can fail if cell not registered
    func dequeueReusableCell<T>(withReuseIdentifier identifier: String = T.identifier, for indexPath: IndexPath) -> T where T: UICollectionViewCell {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T else {
            assertionFailure("Cell \(T.classForCoder()) not registered in collectionView")
            return T()
        }
        
        return cell
    }
}
