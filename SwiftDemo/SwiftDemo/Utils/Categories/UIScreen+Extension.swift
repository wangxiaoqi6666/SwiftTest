//
//  UIScreen+Extension.swift
//  SwiftDemo
//
//  Created by xnhl_iosQ on 2020/11/11.
//

import UIKit

extension UIScreen {
    @objc public static var bottomEdge: CGFloat {
        guard let window = UIApplication.shared.windows.first else { return 0}
        if #available(iOS 11.0, *) {
            let bottom = window.safeAreaInsets.bottom
            return bottom == 0 ? 0 : bottom
        } else {
            return 0
        }
    }
}
