//
//  GroupEventResult.swift
//  IOS@Taipei
//
//  Created by tkuo on 2019/10/23.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import Foundation

struct GroupEventResult: Codable {
    let data: [GroupEvent]
    let paging: GroupEventPaging
}

// MARK: - Paging
struct GroupEventPaging: Codable {
    let cursors: GroupEventCursors
    let next: String
}

struct GroupEventCursors: Codable {
    let before, after: String
}
