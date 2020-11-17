//
//  GlobleSetting.swift
//  SwiftDemo
//
//  Created by xnhl_iosQ on 2020/11/11.
//

import UIKit
import Foundation

let kGlobleColor = UIColor.mavlColorWithHex(rgb: 0x01C6B1)
let kGlobalPressedColor = UIColor.mavlColorWithHex(rgb: 0xf3f4f6)
let kTabbarNormalColor = UIColor.mavlColorWithHex(rgb: 0xA9B2BF)
let kGlobalWhiteColor = UIColor.mavlColorWithHex(rgb: 0xffffff)
let kGlobalBlackColor = UIColor.mavlColorWithHex(rgb: 0x000000)
let kGlobalGrayColor = UIColor.mavlColorWithHex(rgb: 0xA9B2BF)

let kScreenB = UIScreen.main.bounds
let kScreenW = UIScreen.main.bounds.size.width
let kScreenH = UIScreen.main.bounds.size.height
let kScaleW = (kScreenW / 375.0)
let kScaleH = (kScreenH / 667.0)

let IS_iPad = UI_USER_INTERFACE_IDIOM() == .pad

let kNorStaBarH: CGFloat = 20
let kFullStaBarH: CGFloat = 44
let kStaBarH: CGFloat = IS_IPHONEX ? kFullStaBarH : kNorStaBarH;

let kNavBarH: CGFloat = 44;

let kStaNavBarH: CGFloat = kStaBarH + kNavBarH

let kTabBarH: CGFloat = IS_IPHONEX ? 83 : 49

let kBottomSafeH: CGFloat = IS_IPHONEX ? 34 : 0

//let IS_IPHONEX = UIApplication.shared.statusBarFrame.height == kFullStaBarH ? true : false

let IS_IPHONEX = UIScreen.bottomEdge > 0.0 ? true : false


/// 设备对象
let SD_Divice = UIDevice.current

private func EMPTY_STR(str: String) -> Bool {
    return str.isEmpty
}

//let IS_IPHONEX = iPhoneX()
//
//public func iPhoneX() -> Bool {
//    // 利用safeAreaInsets.bottom > 0 来判断是否是iPhoneX系列
//    guard let w = UIApplication.shared.delegate?.window else {
//        return false
//    }
//
//    guard #available(iOS 11.0, *) else {
//        return false
//    }
//
//    return w!.safeAreaInsets.bottom > 0.0
//}
