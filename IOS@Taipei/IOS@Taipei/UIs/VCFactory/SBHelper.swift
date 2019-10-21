//
//  SBHelper.swift
//  IOS@Taipei
//
//  Created by Aaron_Ni on 2019/10/20.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import UIKit

final class SBHelper {
    
    static func instanceVCfromSB(storyBoardName: String, viewControllerID: String) -> UIViewController? {
        let sb = UIStoryboard(name: storyBoardName, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: viewControllerID)
        return vc
    }
    
    static func instanceVCfromSB(vcID: ViewControllerSBID) -> UIViewController? {
        return instanceVCfromSB(storyBoardName: getSBName(for: vcID).id,
                                viewControllerID: vcID.id)
    }
    
    private static func getSBName(for vcID: ViewControllerSBID) -> SBName {
        switch vcID {
        case .launch, .tabBarController:
            return .main
        case .eventList, .eventDetail:
            return .event
        }
    }
}

enum SBName: String {
    case main   = "Main"
    case event  = "Event"
    
    var id: String { return rawValue }
}

/// VC's sbID
enum ViewControllerSBID: String {
    
    // in Main.storyboard
    case launch             = "LaunchVC"
    case tabBarController   = "TabBarController"
    
    // in Event.storyboard
    case eventList     = "EventListVC"
    case eventDetail   = "EventDetailVC"
    
    var id: String { return rawValue }
}

