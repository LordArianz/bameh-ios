//
//  BMModel.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/30/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
import Reflection
import SwiftyJSON
/*
@objc class BMModel: Object {
    required init?(_ jsonData: JSON? = nil){
        super.init()
        guard let json: JSON = jsonData else { return }
        let mirror = Mirror(reflecting: self)
        
        for (name, value) in mirror.children {
            guard let name = name else { continue }
            
            let ptype = type(of: value)
            //print("ino bas bede :::"+name)
            var propKey: String = name == "desc" ? "description" : name
            if propKey.hasSuffix("Methods") {
                propKey = propKey.capitalizingFirstLetter()
                propKey = "available" + propKey
            }
            if !json[propKey].exists(){ continue }
            
            var className: String = String(describing: ptype)
            let arr: [String] = ["ImplicitlyUnwrappedOptional<", "Optional<"]
            for str in arr {
                if className.starts(with: str) {
                    let start = className.index(className.startIndex, offsetBy: str.count)
                    let end = className.index(className.endIndex, offsetBy: -1)
                    let range = start..<end
                    className = String(className[range])
                }
            }
            
            if className.starts(with: "BM") {
                var inTypeString: String = className
                let comps = NSStringFromClass(BMModel.self).components(separatedBy: ".")
                if comps.count > 1 {
                    inTypeString = comps[0] + "." + inTypeString
                }
                //print(name+": ")
                //print(inTypeString)
                self.setValue((NSClassFromString(inTypeString) as! BMModel.Type).init(json[propKey])!, forKey: name)
            } else if className.starts(with: "Array") {
                
                var inTypeString: String = className.replacingOccurrences(of: "Array<", with: "")
                inTypeString.removeLast()
                
                let array: Array = json[propKey].arrayValue
                
                if inTypeString.starts(with: "BM"){
                    let comps = NSStringFromClass(BMModel.self).components(separatedBy: ".")
                    if comps.count > 1 {
                        inTypeString = comps[0] + "." + inTypeString
                    }
                    var arr: [Any] = []
                    for item in array {
                        arr.append((NSClassFromString(inTypeString) as! BMModel.Type).init(item)!)
                    }
                    //print(name+": ")
                    //print(arr)
                    self.setValue(arr, forKey: name)
                }
                else {
                    var arr: [Any] = []
                    for item in array {
                        arr.append(item.rawValue)
                    }
                    //print(name+": ")
                    //print(arr)
                    self.setValue(arr, forKey: name)
                }
            } else {
                if json[propKey] == nil {
                    //print(name+": ")
                } else {
                    //print(json[propKey].rawValue)
                    self.setValue(json[propKey].rawValue, forKey: name)
                }
            }
        }
    }
    
    required init(value: Any, schema: RLMSchema) {
        fatalError("init(value:schema:) has not been implemented")
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        fatalError("init(realm:schema:) has not been implemented")
    }
    
    func toJson() -> [String: Any] {
        var json: [String: Any] = [:]
        let mirror = Mirror(reflecting: self)
        
        for (name, value) in mirror.children {
            guard let name = name else { continue }
            
            let ptype = type(of: value)
            let propKey: String = name == "desc" ? "description" : name
            var className: String = String(describing: ptype)
            let arr: [String] = ["ImplicitlyUnwrappedOptional<", "Optional<"]
            for str in arr {
                if className.starts(with: str) {
                    let start = className.index(className.startIndex, offsetBy: str.count)
                    let end = className.index(className.endIndex, offsetBy: -1)
                    let range = start..<end
                    className = String(className[range])
                }
            }
            
            if className.starts(with: "BM") {
                json[propKey] = (value as! BMModel).toJson()
            } else if className.starts(with: "Array") {
                let arr = value as! [Any]
                var arrj: [Any] = []
                var inTypeString: String = className.replacingOccurrences(of: "Array<", with: "")
                inTypeString.removeLast()
                
                if inTypeString.starts(with: "BM"){
                    for item in arr {
                        arrj.append((item as! BMModel).toJson())
                    }
                }
                else {
                    for item in arr {
                        arrj.append(item)
                    }
                }
                json[propKey] = arrj
            } else {
                json[propKey] = value
            }
        }
        return json
    }

}
*/
