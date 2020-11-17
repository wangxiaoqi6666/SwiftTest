//
//  UIColor+MavlExtension.swift
//  ExtensionSwiftDemo
//
//  Created by xnhl_iosQ on 2020/10/29.
//

import UIKit

extension UIColor {
    
    // 十六进制UIColor 不透明
    static func mavlColorWithHex(rgb: Int) -> UIColor {
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgb & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(rgb & 0xFF)) / 255.0, alpha: 1.0)
    }
    
    // 十六进制UIColor 设置透明度
    static func mavlColorWithHex(rgb: Int, alpha: CGFloat) -> UIColor {
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgb & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(rgb & 0xFF)) / 255.0, alpha: alpha)
    }
    
    
}
