//
//  BMItem.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 8/26/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

enum BMItemType: String {
    case person = "Person"
}

@objc class BMItem: Object {
    
    @objc dynamic var id: NSNumber! = 1
    @objc dynamic var name: String!
    @objc dynamic var type: String!
    @objc dynamic var scanCount: NSNumber! = 0
    @objc dynamic var favCount: NSNumber! = 0
    @objc dynamic var hashString: String!
    
    private var cacheDetailedModel: Any?
    func getDetailedModel() -> Any? {
        if cacheDetailedModel == nil {
            // there is currently only person so:
            cacheDetailedModel = Database.objects(BMPerson.self)
                .filter("item.id == \(self.id.int64Value)").first
        }
        return cacheDetailedModel
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    required init() {
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        fatalError("init(value:schema:) has not been implemented")
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        fatalError("init(realm:schema:) has not been implemented")
    }
    
}


