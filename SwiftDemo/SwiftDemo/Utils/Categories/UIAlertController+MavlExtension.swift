//
//  UIAlertController+MavlExtension.swift
//  ExtensionSwiftDemo
//
//  Created by xnhl_iosQ on 2020/10/30.
//
import UIKit
import Foundation

extension UIAlertController {
    // 在指定视图控制器上弹出提示框
    static func mavlShowAlert(title: String, message: String, viewController: UIViewController, actionTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default))
        viewController.present(alert, animated: true)
    }
     
    // 在指定视图控制器上弹出sheet提示框
    static func mavlShowSheetAlert(title: String, message: String, viewController: UIViewController, actions: [String]) {
        let alertSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for action in actions {
            alertSheet.addAction(UIAlertAction(title: action, style: .default))
        }
        viewController.present(alertSheet, animated: true)
    }
     
    static func mavlShowAlertWithAction(title: String, message: String, viewController: UIViewController, okActionTitle: String, cancelActionTitle: String, okActionClick:  ((UIAlertAction)->Void)?,cancelActionClick: ((UIAlertAction)->Void)?, okOnLeft: Bool) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if okOnLeft == true {
            alert.addAction(UIAlertAction(title: okActionTitle, style: .default, handler: okActionClick))
            alert.addAction(UIAlertAction(title: cancelActionTitle, style: .default, handler: cancelActionClick))
        } else {
            alert.addAction(UIAlertAction(title: cancelActionTitle, style: .default, handler: cancelActionClick))
            alert.addAction(UIAlertAction(title: okActionTitle, style: .default, handler: okActionClick))
        }
        viewController.present(alert, animated: true)
    }
    
}
