//
//  GroupEvent.swift
//  IOS@Taipei
//
//  Created by tkuo on 2019/10/23.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import Foundation

struct GroupEvent: Codable {
    let interestedCount, attendingCount, declinedCount, maybeCount: Int
    let noreplyCount: Int
    let cover: GroupEventCover?
    let description: String?
    let name: String
    let place: GroupEventPlace?
    let startTime: String?
    let endTime: String?
    let updatedTime: String?
    let type, id: String

    enum CodingKeys: String, CodingKey {
        case interestedCount
        case attendingCount
        case declinedCount
        case maybeCount
        case noreplyCount
        case cover
        case description
        case name, place
        case startTime
        case endTime
        case updatedTime
        case type, id
    }
}
