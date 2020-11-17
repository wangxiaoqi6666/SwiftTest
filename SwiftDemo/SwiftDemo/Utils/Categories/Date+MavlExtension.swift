//
//  NSDate+.swift
//  ExtensionSwiftDemo
//
//  Created by xnhl_iosQ on 2020/10/29.
//

import UIKit

extension Date {
    
    /// 将date按照设置的格式转化为String
    /// - Parameters:
    ///   - format: 时间格式
    ///   - date: 需要转化的date
    /// - Returns: 转化后的String
    static func mavlStringWithFormat(format: String, date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
    /// 将date按照设置的格式转化为string
    /// - Parameters:
    ///   - format: 时间格式
    ///   - date: 需要转化的date
    ///   - local: 地区 eg： en_US
    /// - Returns: 转化后的String
    static func mavlStringWithLocal(format: String, date: Date, local: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: local) as Locale
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
    /// 将date按照设置的格式转化为string
    /// - Parameters:
    ///   - style: 日期取值格式样式 eg： 下午7:00:00 2013年5月19日
    ///   - date: 需要转化的date
    ///   - local: 地区 eg： en_US
    /// - Returns: 转化后的String
    static func mavlStringWithNewStyle(style: DateFormatter.Style, date: Date, local: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: local) as Locale
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: date)
    }
    
    // 获取属于年份
    static func mavlYearIndex(date: Date) -> Int {
        let calendar = Calendar.current
        let timeZone = TimeZone.init(identifier: "UTC")
        let components = calendar.dateComponents(in: timeZone!, from: date)
        return components.year!
    }
    
    // 获取属于月份
    static func mavlMonthIndex(date: Date) -> Int {
        let calendar = Calendar.current
        let timeZone = TimeZone.init(identifier: "UTC")
        let components = calendar.dateComponents(in: timeZone!, from: date)
        return components.month!
    }
    
    // 获取属于月份的一共几天
    static func mavlDaysOfMonth(date: Date) -> Int {
        let calendar = Calendar.current
        let range = calendar.range(of: Calendar.Component.day, in: Calendar.Component.month, for: date)
        return (range?.count)!
    }
    
    // 当前星期几
    static func mavlGetWeekdayOfDate(date: Date) -> Int {
        let calendar = Calendar.current
        let timeZone = TimeZone.init(identifier: "UTC")
        let components = calendar.dateComponents(in: timeZone!, from: date)
        return components.weekday!-1 //从星期日开始，也就是星期天是1 星期一是2 ……星期六是7
    }
    
    // 比较日期是否相同
    static func mavlIsSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        let timeZone = TimeZone.init(identifier: "UTC")
        let components1 = calendar.dateComponents(in: timeZone!, from: date1)
        let components2 = calendar.dateComponents(in: timeZone!, from: date2)
 
        return components1.year == components2.year && components1.month == components2.month && components1.day == components2.day
    }
    
    // 分别输入数字转化为完整日期
    static func mavlGetDateWithYear(year: Int, month: Int, day: Int) -> Date {
        var components = DateComponents.init()
        components.year = year
        components.month = month
        components.day = day
        
        let calendar = Calendar.current
        let date = calendar.date(from: components)
        return date!
    }

}
