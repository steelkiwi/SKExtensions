//
//  RxSwiftOperators.swift
//  
//
//  Created by Viktor Olesenko on 10.04.17.
//  Copyright © 2017 Steelkiwi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

infix operator <-> : DefaultPrecedence

/// Two-way binding operator
///
/// - Parameters:
///   - property: property object (textfield, label etc) which should be linked with variable
///   - variable: variable object which should be linked with property
/// - Returns: Disposable object with combined property & variable disposables
func <-> <T>(property: ControlProperty<T>, variable: Variable<T>) -> Disposable {
    let bindToUIDisposable = variable.asObservable()
        .bindTo(property)
    
    let bindToVariable = property
        .observeOn(MainScheduler.instance)
        .subscribe(onNext: { n in
            variable.value = n
        }, onCompleted:  {
            bindToUIDisposable.dispose()
        })
    
    return Disposables.create(bindToUIDisposable, bindToVariable)
}
