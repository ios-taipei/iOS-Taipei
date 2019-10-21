//
//  Array + Extension.swift
//  IOS@Taipei
//
//  Created by Aaron_Ni on 2019/10/20.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import Foundation

extension Array {
    typealias E = Element
    
    mutating func removeElements(of indexes: [Int]) {
        guard indexes.isEmpty == false else { return }
        for i in 0 ..< indexes.count {
            let removeIndex = indexes[indexes.count - 1 - i]
            guard removeIndex < count else { continue }
            remove(at: removeIndex)
        }
    }
    
    subscript(safe index: Int) -> E? {
        guard index >= 0, index < count else { return nil }
        let element = self[index]
        return element
    }
}
