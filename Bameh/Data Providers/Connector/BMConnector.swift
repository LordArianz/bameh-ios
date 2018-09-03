//
//  BMConnector.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 8/2/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import Foundation
import Alamofire

class BMConnector {
    func sendRequest(_ url: String, method: HTTPMethod, input: String){
        let url = url + (url.contains("?") ? (url.last == "&" ? "" : "&") : "?") + "lang=" + Config.language
        var headers: HTTPHeaders = [
            "X-ACCESS-TOKEN": "AENVDSIJFEwq332432d0123123"
        ]
        if UserData.token != nil {
            headers["Authorization"] = "Token " + UserData.token!
        }
        var request: URLRequest = try! URLRequest(url: url, method: method, headers: headers)
        request.httpBody = input.data(using: .utf8)
        let session: URLSession = URLSession(configuration: .default)
        session.dataTask(with: request) { (data, response, error) in
            
        }.resume()
    }
}
