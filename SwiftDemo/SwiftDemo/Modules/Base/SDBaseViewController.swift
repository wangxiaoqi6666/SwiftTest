//
//  SDBaseViewController.swift
//  SwiftDemo
//
//  Created by xnhl_iosQ on 2020/11/12.
//

import UIKit

class SDBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        base_config()
        
    }
    
    public func base_config() {
        view.backgroundColor = .white
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
