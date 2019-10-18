//
//  FirstViewController.swift
//  IOS@Taipei
//
//  Created by kidnapper on 2019/10/13.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        FacebookEventRepository.shared.setup(with: Secrets.accessToken.rawValue)
        FacebookEventRepository.shared.fetchFacebookEvents { (result) in
            switch result {
            case .success(let events):
                print("events -> \(events)")
            case .failure(let error):
                print("error -> \(error)")
            }
        }
    }


}

