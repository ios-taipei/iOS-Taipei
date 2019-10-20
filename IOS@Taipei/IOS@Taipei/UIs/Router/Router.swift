//
//  Router.swift
//  IOS@Taipei
//
//  Created by Aaron_Ni on 2019/10/20.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//
import UIKit

final class Router {
    
    enum ShowMode {
        case show
        case push
        case present
    }
    
    static var keyWindow: UIWindow? {
        if let window = (UIApplication.shared.delegate as? AppDelegate)?.window {
            return window
        } else {
            let window = UIWindow.init(frame: UIScreen.main.bounds)
            window.makeKeyAndVisible()
            (UIApplication.shared.delegate as? AppDelegate)?.window = window
            return window
        }
    }
    
    static func changeRootVC(to vc: UIViewController, animated: Bool = true, afterScreenUpdates: Bool = false) {
        guard animated else {
            keyWindow?.rootViewController = vc
            return
        }
        DispatchQueue.main.async {
            let snap = keyWindow?.rootViewController?.view.snapshotView(afterScreenUpdates: afterScreenUpdates)
            
            if let currSnap = snap {
                keyWindow?.addSubview(currSnap)
            }
            
            keyWindow?.rootViewController = vc
            UIView.animate(withDuration: 0.25, animations: {
                snap?.alpha = 0
            }, completion: { _ in
                snap?.removeFromSuperview()
            })
        }
    }
    
    static func show(_ vc: UIViewController, fromVC: UIViewController, hideNavBar: Bool = false, mode: ShowMode, animated: Bool = true) {
        DispatchQueue.main.async {
            vc.view.endEditing(true)
            
            guard mode != .present else {
                fromVC.present(vc, animated: animated, completion: nil)
                return
            }
            
            guard let navController = (fromVC.navigationController ?? fromVC as? UINavigationController) ?? getTopNavController() else {
                fromVC.present(vc, animated: animated, completion: nil)
                return
            }
            navController.isNavigationBarHidden = hideNavBar
            
            if mode == .show {
                navController.show(vc, sender: nil)
            } else {
                navController.pushViewController(vc, animated: animated)
            }
        }
    }
    
    static func showAlert(form vc: UIViewController, title: String, msg: String?, cancelTitle: String = "OK", confirmTitle: String? = nil, completion: ((_ action: UIAlertAction) -> Void)? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
            
            if let confirmTitle = confirmTitle {
                let cancel = UIAlertAction(title: cancelTitle, style: .default, handler: nil)
                alert.addAction(cancel)
                let confirm = UIAlertAction(title: confirmTitle, style: .default, handler: completion)
                alert.addAction(confirm)
            } else {
                let cancel = UIAlertAction(title: cancelTitle, style: .default, handler: completion)
                alert.addAction(cancel)
            }
            vc.present(alert, animated: true, completion: nil)
        }
    }
    
    private static func getTopNavController() -> UINavigationController? {
        return (UIApplication.shared.keyWindow?.rootViewController as? NavigationController)
    }
}
