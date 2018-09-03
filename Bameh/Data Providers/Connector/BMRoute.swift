//
//  Route.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 8/2/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

protocol BMRoute {
    var url: String { get }
    var method: HTTPMethod { get }
}

class Struct {
    static func serialize<T : Codable>(_ codable: T) -> String {
        let jsonData = try! JSONEncoder().encode(codable)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        return jsonString
    }
}
class Route {
    // ids
    struct Search: BMRoute {
        let url: String = "/djsahgdhas/dsafd"
        let method: HTTPMethod = .post
        let disposeBag: DisposeBag = DisposeBag()
        func send(_ input: Input) -> Observable<[Int64]?> {
            let input: String = Struct.serialize(input)
            let output: Variable<[Int64]?> = Variable(nil)
            return output.asObservable()
        }
        struct Input: Codable {
            let query: String
            let lat: Double?
            let lng: Double?
        }
    }

    struct LocationSearch: BMRoute {
        let url: String = "/djsahgdhas/dsafd"
        let method: HTTPMethod = .post
        let disposeBag: DisposeBag = DisposeBag()
        func send(_ input: Input) -> Observable<[Int]?> {
            let input: String = Struct.serialize(input)
            let output: Variable<[Int]?> = Variable(nil)
            return output.asObservable()
        }
        struct Input: Codable {
            let lat: Double
            let lng: Double
        }
    }

    struct UpdateToday: BMRoute {
        let url: String = "/djsahgdhas/dsafd"
        let method: HTTPMethod = .post
        let disposeBag: DisposeBag = DisposeBag()
        func send(_ input: Input) -> Observable<(ids: [Int], isRefresh: Bool)?> {
            let input: String = Struct.serialize(input)
            let output: Variable<(ids: [Int], isRefresh: Bool)?> = Variable(nil)
            return output.asObservable()
        }
        struct Input: Codable {
            let maxId: UInt64
        }
    }
    
    // values
    struct Items {
        let url: String = "/djsahgdhas/dsafd"
        let method: HTTPMethod = .post
        let disposeBag: DisposeBag = DisposeBag()
        func send(_ input: Input) -> Observable<[BMItem]?> {
            let input: String = Struct.serialize(input)
            let output: Variable<[BMItem]?> = Variable(nil)
            return output.asObservable()
        }
        struct Input: Codable {
            let ids: [Int64]
        }
    }
    
    struct Scan: BMRoute {
        let url: String = "/djsahgdhas/dsafd"
        let method: HTTPMethod = .post
        let disposeBag: DisposeBag = DisposeBag()
        func send(_ input: Input) -> Observable<Int?> {
            let input: String = Struct.serialize(input)
            let output: Variable<Int?> = Variable(nil)
            return output.asObservable()
        }
        struct Input: Codable {
            let hash: String
        }
    }
}

