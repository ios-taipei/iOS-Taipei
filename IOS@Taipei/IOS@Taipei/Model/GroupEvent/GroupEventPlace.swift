//
//  GroupEventPlace.swift
//  IOS@Taipei
//
//  Created by tkuo on 2019/10/23.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import Foundation

struct GroupEventPlace: Codable {
    let name: String
    let location: GroupEventLocation?
}

struct GroupEventLocation: Codable {
    let city, country: String
    let latitude, longitude: Double
    let street, zip: String
}
