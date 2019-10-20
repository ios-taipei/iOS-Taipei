//
//  VCFactory.swift
//  IOS@Taipei
//
//  Created by Aaron_Ni on 2019/10/20.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import UIKit

final class VCFactory {
    
    static func get<T: UIViewController>(_ type: T.Type, vcID: ViewControllerSBID) -> T? {
        let vc = SBHelper.instanceVCfromSB(vcID: vcID) as? T
        return vc
    }
}
