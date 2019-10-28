//
//  GroupEventCover.swift
//  IOS@Taipei
//
//  Created by tkuo on 2019/10/23.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import Foundation

struct GroupEventCover: Codable {
    let offsetX, offsetY: Int
    let source: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case offsetX
        case offsetY
        case source, id
    }
}
