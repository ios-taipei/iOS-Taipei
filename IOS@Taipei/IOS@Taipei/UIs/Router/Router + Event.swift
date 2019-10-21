//
//  Router + Event.swift
//  IOS@Taipei
//
//  Created by Aaron_Ni on 2019/10/20.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//
import UIKit

extension Router {
    
    static func showEventDetailVC(from vc: UIViewController, mode: ShowMode = .push) {
        guard let targetVC = VCFactory.get(EventDetailVC.self, vcID: .eventDetail) else { return }
        show(targetVC, fromVC: vc, mode: mode)
    }
}
