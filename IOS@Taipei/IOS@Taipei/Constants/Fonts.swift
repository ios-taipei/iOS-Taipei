//
//  Fonts.swift
//  IOS@Taipei
//
//  Created by Aaron_Ni on 2019/10/20.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import UIKit

extension UIFont {
    
    // Event Detail
    static var app_eventDetailTime: UIFont          { return .systemFont(ofSize: 12) }
    static var app_eventDetailTopic: UIFont         { return UIFont(name: "SFProDisplay-Semibold", size: 20) ?? .boldSystemFont(ofSize: 20) }
    static var app_eventDetailInfo: UIFont          { return .systemFont(ofSize: 12) }
    static var app_eventDetailDescTitle: UIFont     { return .boldSystemFont(ofSize: 20) }
    static var app_eventDetailDescContent: UIFont   { return .systemFont(ofSize: 16) }
    
}
