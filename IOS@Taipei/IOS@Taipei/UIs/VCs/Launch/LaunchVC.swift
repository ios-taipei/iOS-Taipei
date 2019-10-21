//
//  LaunchVC.swift
//  IOS@Taipei
//
//  Created by Aaron_Ni on 2019/10/20.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import UIKit

class LaunchVC: UIViewController {
    
    @IBOutlet private weak var imgView: UIImageView!
    
    private var group: DispatchGroup = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        group.enter() // Call some apis
        callSomeApis()
        
        group.notify(queue: .main) {
            Router.showMainVC()
        }
    }
    
    private func callSomeApis() {
        group.leave()
    }
}
