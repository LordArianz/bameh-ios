//
//  String+URLEncode.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/15/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import Foundation

extension String {
    func encodeURIComponent() -> String? {
        var characterSet = CharacterSet.alphanumerics
        characterSet.insert(charactersIn: "-_.!~*'()")
        return self.addingPercentEncoding(withAllowedCharacters: characterSet)
    }
}
