//
//  BMUserData.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/16/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import Foundation

class BMUserData {
    private var _phone: String? = nil
    var phone: String? {
        get {
            if _phone == nil {
                _phone = UserDefaults.standard.string(forKey: "BM.User.Phone")
            }
            return _phone
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "BM.User.Phone")
            _phone = newValue
        }
    }
    
    private var _token: String? = nil
    var token: String? {
        get {
            if _token == nil {
                _token = UserDefaults.standard.string(forKey: "BM.User.Token")
            }
            return _token
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "BM.User.Token")
            _token = newValue
        }
    }
    
    private var _showHint: Bool? = nil
    var showHint: Bool? {
        get {
            if _showHint == nil {
                _showHint = UserDefaults.standard.bool(forKey: "BM.User.showHint")
            }
            return _showHint
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "BM.User.showHint")
            _showHint = newValue
        }
    }
}
