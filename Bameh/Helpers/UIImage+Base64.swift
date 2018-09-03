//
//  UIImage+Base64.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/15/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import UIKit

extension UIImage {
    class func image(with strBase64: String) -> UIImage {
        let decodedData: Data = Data(base64Encoded: strBase64, options: .ignoreUnknownCharacters)!
        let image = UIImage(data: decodedData)
        return image!
    }

    func encodeB64() -> String{
        let jpegCompressionQuality: CGFloat = 0.9
        return (UIImageJPEGRepresentation(self, jpegCompressionQuality)?.base64EncodedString())!
    }
}
