//
//  Builder.swift
//  
//
//  Created by Dossymkhan Zhulamanov on 27.06.2023.
//

import UIKit

public protocol Builder {}

public extension Builder where Self: AnyObject {
    @discardableResult
    func set<T>(_ keyPath: ReferenceWritableKeyPath<Self, T>, to newValue: T) -> Self {
        self[keyPath: keyPath] = newValue
        return self
    }
    
    func reinforce(_ handler: (Self) -> ()) -> Self {
        handler(self)
        return self
    }
}

extension NSObject: Builder {}
