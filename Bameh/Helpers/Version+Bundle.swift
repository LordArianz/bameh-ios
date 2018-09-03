//
//  Version+Bundle.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/15/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import Foundation

extension Bundle {
    var versionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
