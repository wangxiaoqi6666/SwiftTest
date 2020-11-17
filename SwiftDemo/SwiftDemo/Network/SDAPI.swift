//
//  SDAPI.swift
//  SwiftDemo
//
//  Created by xnhl_iosQ on 2020/11/13.
//

import Foundation

struct APIItem: HWAPIProtocol {
    var url: String { API.DOMAIN + URLPath } // 域名 + path
    let description: String
    let extra: String?
    var method: HWHTTPMethod
    
    private let URLPath: String // url的path
    
    init(_ path: String, d: String, e: String? = nil, m: HWHTTPMethod = .get) {
        URLPath = path
        description = d
        extra = e
        method = m
    }
    
    init(_ path: String, m: HWHTTPMethod) {
        self.init(path, d: "", e: nil, m: m)
    }
    
}

struct API {
    /// 项目的域名
    static var DOMAIN = "https://www.kaihuibao.net"
//    static var NameSpacing = DOMAIN + "?service="
    
    struct LoginApi {
        static let loginApi = APIItem("/api/user/login", d: "loginRequest", m: .post)
    }
    
    // MARK: Homelist列表
    struct HomeList {
        static let homeList = APIItem("", d: "首页list", m: .post)
    }
    
    // MARK: getuserinfo
    struct GetAllNumberApi {
        static let getUserInfo = APIItem("App.UserNew.GetAllNumber", d: "获取全部号码列表")
    }
}
