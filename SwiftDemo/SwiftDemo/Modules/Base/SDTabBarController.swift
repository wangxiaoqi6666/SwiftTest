//
//  SDTabBarController.swift
//  SwiftDemo
//
//  Created by xnhl_iosQ on 2020/11/12.
//

import UIKit

class SDTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initTabbarUI()
        
    }
    
    func initTabbarUI() {
        
        self.tabBar.tintColor = kGlobleColor
        self.tabBar.unselectedItemTintColor = kTabbarNormalColor
        
        setUpChildViewController()
        
    }

    func setUpChildViewController() {
        
        let nav0 = self.setChildItem(SDMainViewController(), "tab_recent_grey", "tab_recent_green", "Main")
        let nav1 = self.setChildItem(SDMainViewController(), "tab_contact_grey", "tab_contact_green", "List")
        let nav2 = self.setChildItem(SDMainViewController(), "tab_setting_grey", "tab_setting_green", "Me")
        self.viewControllers = [nav0, nav1, nav2]
        
    }
    
    func setChildItem(_ viewController: UIViewController,
                      _ image: String,
                      _ selectImage: String,
                      _ title: String) -> SDNavigationController {
        
        viewController.title = title
        viewController.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem.selectedImage = UIImage(named: selectImage)?.withRenderingMode(.alwaysOriginal)
        viewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: kTabbarNormalColor], for: .normal)
        viewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: kGlobleColor], for: .selected)
        
        let navVC = SDNavigationController(rootViewController: viewController)
        
        return navVC
        
    }

}


