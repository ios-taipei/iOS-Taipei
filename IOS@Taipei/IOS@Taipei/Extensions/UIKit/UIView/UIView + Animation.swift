//
//  UIView + Animation.swift
//  IOS@Taipei
//
//  Created by Aaron_Ni on 2019/10/20.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import UIKit

extension UIView {
    
    func animation(duration: TimeInterval, delay: TimeInterval = 0, options: UIView.AnimationOptions = [], snapAfterUpdate: Bool, action: ()->Void) {
        guard let snap = snapshotView(afterScreenUpdates: snapAfterUpdate) else { return action() }
        addSubview(snap)
        action()
        UIView.animate(withDuration: duration, delay: delay, options: options, animations: {
            snap.alpha = 0
        }, completion: { _ in
            snap.removeFromSuperview()
        })
    }
}

