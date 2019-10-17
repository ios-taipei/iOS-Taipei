//
//  FacebookEventListPaging.swift
//  IOS@Taipei
//
//  Created by wk on 2019/10/17.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import Foundation

struct FacebookEventListPaging: Codable {
    let cursors: FacebookEventListCursors
    let next: String
}
