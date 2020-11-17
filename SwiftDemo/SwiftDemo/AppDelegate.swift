//
//  AppDelegate.swift
//  SwiftDemo
//
//  Created by xnhl_iosQ on 2020/11/11.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UITabBar.appearance().isTranslucent = false // tabbar不透明防止ios12图片跳动
        
        self.window = UIWindow(frame: kScreenB)
        self.window?.backgroundColor = .white
        if UserDefaults.standard.bool(forKey: "AlreadyLogin") == false {
            self.changeRootVC(isLogin: false)
        } else {
            self.changeRootVC(isLogin: true)
        }
        self.window?.makeKeyAndVisible()
        
        return true
    }

    public func changeRootVC(isLogin: Bool) {
        if isLogin == false {
            let loginVC = SDLoginViewController()
            self.window?.rootViewController = loginVC
        } else {
            let tabBarVC = SDTabBarController()
            self.window?.rootViewController = tabBarVC
        }
    }

}

