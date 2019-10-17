//
//  FacebookEventCover.swift
//  IOS@Taipei
//
//  Created by wk on 2019/10/17.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import Foundation

struct FacebookEventCover: Codable {
    let offsetY: Int
    let id: String
    let offsetX: Int
    let source: String

    enum CodingKeys: String, CodingKey {
        case offsetY = "offset_y"
        case id
        case offsetX = "offset_x"
        case source
    }
}
