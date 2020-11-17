//
//  UIFont+Extension.swift
//  SwiftDemo
//
//  Created by xnhl_iosQ on 2020/11/12.
//

import UIKit

enum SDFontCategory {
    enum fontWeight: String {
        case light = "Light"
        case regular = "Regular"
        case medium = "Medium"
        case semibold = "Semibold"
        case bold = "Bold"
        case heavy = "Heavy"
    }
    
    case PingFangSC(_ size: Int = 14, _ type: fontWeight = .regular)
    case SFProDisplay(_ size: Int = 14, _ type: fontWeight = .regular)
    
}

extension SDFontCategory {
    func fontName() -> (name: String, size: Int) {
        var name = ""
        var fontSize = 0
        switch self {
        case .PingFangSC(let size, let type):
            name = "PingFangSC-" + type.rawValue
            fontSize = size
        case .SFProDisplay(let size, let type):
            name = "SFProDisplay-" + type.rawValue
            fontSize = size
        }
        return (name, fontSize)
        
    }
}

func SDFont(_ category: SDFontCategory) -> UIFont {
    let value = category.fontName()
    let font = UIFont(name: value.name, size: CGFloat(value.size))
    return font!
}

func SDFontPF(_ size: Int, _ type: SDFontCategory.fontWeight) -> UIFont {
    return SDFont(.PingFangSC(size, type))
}

func SDFontSF(_ size: Int, _ type: SDFontCategory.fontWeight) -> UIFont {
    return SDFont(.SFProDisplay(size, type))
}
