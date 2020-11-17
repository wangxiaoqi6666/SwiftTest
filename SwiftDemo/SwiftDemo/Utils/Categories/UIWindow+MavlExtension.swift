//
//  UIWindow+MavlExtension.swift
//  ExtensionSwiftDemo
//
//  Created by xnhl_iosQ on 2020/10/30.
//

import UIKit
import Foundation

extension UIWindow {
    
    // 获取当前显示的VC
    class func mavlGetCurrentViewController() -> UIViewController {
        var currentWindow = UIApplication.shared.keyWindow ?? UIWindow()
        if currentWindow.windowLevel != UIWindow.Level.normal {
            let windowArr = UIApplication.shared.windows
            for window in windowArr {
                if window.windowLevel == UIWindow.Level.normal {
                    currentWindow = window
                    break
                }
            }
        }
        return UIWindow.mavlGetNextXController(nextController: currentWindow.rootViewController) ?? UIViewController()
    }
    
    private class func mavlGetNextXController(nextController: UIViewController?) -> UIViewController? {
        if nextController == nil {
            return nil
        }else if nextController?.presentedViewController != nil {
            return UIWindow.mavlGetNextXController(nextController: nextController?.presentedViewController)
        }else if let tabbar = nextController as? UITabBarController {
            return UIWindow.mavlGetNextXController(nextController: tabbar.selectedViewController)
        }else if let nav = nextController as? UINavigationController {
            return UIWindow.mavlGetNextXController(nextController: nav.visibleViewController)
        }
        return nextController
    }

}
