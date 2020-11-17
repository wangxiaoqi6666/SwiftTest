//
//  SDMainCellModel.swift
//  SwiftDemo
//
//  Created by 王小琪 on 2020/11/12.
//

import UIKit

//class SDCallLogModel: SDBaseModel {
//    var callID: String?
//    var remoteNumber: String?
//    var detail: [String]?
//
//}

enum callType: Int, HandyJSONEnum {
    case callIn = 0
    case callOut
}

struct SDCallLogModel: HandyJSON {
    var callID: String?
    var remote: String?
    var details: [Detail]?
    
    mutating func mapping(mapper: HelpingMapper) {
        mapper.specify(property: &remote, name: "remoteNumber")
        
    }
}

struct Detail: HandyJSON {
    var name: String?
    var type: callType?
}
