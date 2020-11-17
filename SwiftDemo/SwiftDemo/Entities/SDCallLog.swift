//
//  SDCallLog.swift
//  SwiftDemo
//
//  Created by 王小琪 on 2020/11/13.
//

import Foundation

enum callTypeTwo: Int {
    case callIn = 0
    case callOut
}

struct SDCallLog {
    var callID: String?
    var remote: String?
    var details: [Detail_array]?
    
    init(_ jsonData: JSON) {
        callID = jsonData["callID"].stringValue
        remote = jsonData["remoteNumber"].stringValue
//        details = [Detail_array(jsonData["details"])]
        details = jsonData["details"].arrayValue.map {
            Detail_array($0)
        }
    }
    
    init() {
        callID = ""
        remote = ""
        details = []
    }
    
}

struct Detail_array {
    var name: String?
    var type: callTypeTwo?
    
    init(_ jsonData: JSON) {
        name = jsonData["name"].stringValue
        type = callTypeTwo(rawValue: jsonData["type"].intValue)
    }
    
    init() {
        name = ""
        type = .callIn
    }
}
