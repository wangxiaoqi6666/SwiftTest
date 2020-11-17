//
//  UIViewController.swift
//  ExtensionSwiftDemo
//
//  Created by xnhl_iosQ on 2020/10/30.
//

import UIKit
import Foundation

extension UIApplication {
    var mavlCurrentWindow: UIWindow? {
        if #available(iOS 13.0, *) {
            if let window = connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first{
                return window
            }else if let window = UIApplication.shared.delegate?.window{
                return window
            }else{
                return nil
            }
        } else {
            if let window = UIApplication.shared.delegate?.window{
                return window
            }else{
                return nil
            }
        }
    }
}

extension UIViewController {
    
    // 找到当前显示的viewcontroller
    class func mavlCurrent(base: UIViewController? = UIApplication.shared.mavlCurrentWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return mavlCurrent(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return mavlCurrent(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            return mavlCurrent(base: presented)
        }
        if let split = base as? UISplitViewController{
            return mavlCurrent(base: split.presentingViewController)
        }
        return base
    }
    
}
