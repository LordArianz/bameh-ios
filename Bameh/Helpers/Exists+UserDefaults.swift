//
//  Exists+UserDefaults.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/15/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    static func exists(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
}
