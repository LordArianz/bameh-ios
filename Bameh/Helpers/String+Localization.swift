//
//  String+Localization.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/15/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import Foundation


extension String {
    static func localized(_ phrase: String) -> String {
        return NSLocalizedString(phrase, tableName: Config.language,
                                 bundle: Bundle.main, value: phrase, comment: "")
    }
}
