//
//  Color.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/15/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import UIKit
import Reflection

enum BMColorName {
    case mainBackground
    case primary
    case tabBarSelected
    case tabBarDeselected
    case tabBarBackground
    case searchBarBackground
    case searchFieldPlaceholder
    case vcBackground
    case textLight
    case itemImageBorder
    case black
    case white
    case profileOptionTitle
    case profileOptionTopic
    case profileOptionRed
    case imagePlaceholder
    case phoneNumber
    case editBtn
    case version
    case todayPostBorder
}

struct BMColors: Encodable {
    let mainBackground: Int = 0xffffff
    let primary: Int = 0xf74042
    let tabBarSelected: Int = 0x4a90e2
    let tabBarDeselected: Int = 0xacb8c1
    let tabBarBackground: Int = 0xffffff
    let searchBarBackground: Int = 0xe9ecf0
    let searchFieldPlaceholder: Int = 0x000000
    let vcBackground: Int = 0xf6f9fd
    let textLight: Int = 0x86888c
    let itemImageBorder: Int = 0xf7f4f4
    let black: Int = 0x000000
    let white: Int = 0xffffff
    let profileOptionTitle: Int = 0x030303
    let profileOptionTopic: Int = 0x6d6d72
    let profileOptionRed: Int = 0xd0021b
    let imagePlaceholder: Int = 0xd8d8d8
    let phoneNumber: Int = 0x8e8e93
    let editBtn: Int = 0x4a90e2
    let version: Int = 0xa9abb0
    let todayPostBorder: Int = 0xe1e1e1
}

@objc class Color: NSObject {
    
    //static let
    static let hex: BMColors = BMColors()
    static func get(_ name: BMColorName, alpha: CGFloat = 1) -> UIColor {
        let nameString: String = String.init(describing: name)
        let dict: [String: Int] = try! JSONDecoder().decode([String: Int].self, from: JSONEncoder().encode(hex))
        let colorValue: Int = dict[nameString]!
        return UIColor(red: CGFloat((colorValue & 0xff0000) >> 16) / 255.0,
                       green: CGFloat((colorValue & 0xff00) >> 8) / 255.0,
                       blue: CGFloat(colorValue & 0xff) / 255.0,
                       alpha: alpha)
    }
}
