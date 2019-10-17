//
//  FacebookEvent.swift
//  IOS@Taipei
//
//  Created by wk on 2019/10/17.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import Foundation

struct FacebookEvent: Codable {
    let name: String
    let attendingCount: Int
    let id: String
    let startTime: String
    let declinedCount: Int
    let cover: FacebookEventCover?
    let description: String?
    let place: FacebookEventPlace
    let maybeCount: Int

    enum CodingKeys: String, CodingKey {
        case name
        case attendingCount = "attending_count"
        case id
        case startTime = "start_time"
        case declinedCount = "declined_count"
        case cover
        case description
        case place
        case maybeCount = "maybe_count"
    }
}
