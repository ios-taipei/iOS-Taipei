//
//  NSObject + Builder.swift
//  IOS@Taipei
//
//  Created by Aaron_Ni on 2019/10/20.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import Foundation

protocol Buildable: AnyObject { }

extension Buildable {
    
    @discardableResult
    func set<T>(_ keyPath: ReferenceWritableKeyPath<Self, T>, to value: T) -> Self {
        self[keyPath: keyPath] = value
        return self
    }
}

extension NSObject: Buildable { }

