//
//  String+MavlExtension.swift
//  ExtensionSwiftDemo
//
//  Created by xnhl_iosQ on 2020/10/30.
//

import Foundation

extension String {
    
    /// 将dateStr转换成date
    /// - Parameters:
    ///   - dateStr: date的字符串
    ///   - formate: 时间格式
    /// - Returns: Date
    static func mavlDateWithFormateString(dateStr: String, formate: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formate
        return dateFormatter.date(from: dateStr)
        
    }
    
    /// 时间戳转字符串
    /// - Parameters:
    ///   - timeInterval: 时间戳（单位：s）
    ///   - formate: 时间格式
    /// - Returns: 转化后的string
    static func mavlTimeIntervalToTimeStr(timeInterval: Int, formate: String) -> String {
        let timeInter = TimeInterval(timeInterval)
        let date = Date.init(timeIntervalSince1970: timeInter)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formate
        return dateFormatter.string(from: date)
    }
    
    func bigger(string: String) -> String {
        return string
    }
     
}
