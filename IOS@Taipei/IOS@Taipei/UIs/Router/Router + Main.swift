//
//  Router + Main.swift
//  IOS@Taipei
//
//  Created by Aaron_Ni on 2019/10/20.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import UIKit

extension Router {
    
    static func showMainVC(isMakeMoneyDisplay: Bool = false) {
        guard let tabbarController = VCFactory.get(TabBarController.self, vcID: .tabBarController) else { return }
        let navController = NavigationController.init(rootViewController: tabbarController)
        changeRootVC(to: navController, animated: true, afterScreenUpdates: true)
    }
    
    static func showLaunchVC() {
        guard let launchVC = VCFactory.get(LaunchVC.self, vcID: .launch) else { return }
        changeRootVC(to: launchVC, animated: false)
    }
}
