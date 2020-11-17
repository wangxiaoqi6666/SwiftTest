//
//  SDNavigationController.swift
//  SwiftDemo
//
//  Created by xnhl_iosQ on 2020/11/12.
//

import UIKit

class SDNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.isTranslucent = false
        
        self.navigationBar.barTintColor = kGlobleColor
        self.navigationBar.tintColor = kGlobalWhiteColor
        self.navigationBar.backgroundColor = kGlobalWhiteColor
        
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: kGlobalWhiteColor, NSAttributedString.Key.font: SDFontPF(24, .medium)];
        
        self.navigationBar.shadowImage = UIImage()
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if viewController.navigationItem.leftBarButtonItem == nil && self.viewControllers.count > 1 && viewController.navigationItem.leftBarButtonItems?.count == 0 {
            let backImg = UIImage(named: "ic_back_gray56")?.withRenderingMode(.alwaysOriginal)
            let backBtn = UIBarButtonItem(image: backImg, style: .plain, target: self, action: #selector(popSelf))
            self.navigationItem.leftBarButtonItem = backBtn
        }
        
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: true)
        
    }

    @objc func popSelf() {
        self.popViewController(animated: true)
    }
    
}
