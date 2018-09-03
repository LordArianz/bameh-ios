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


@objc class BMPost: Object {
    
    @objc dynamic var id: NSNumber! = 1
    @objc dynamic var title: String!
    @objc dynamic var subtitle: String!
    @objc dynamic var likes: NSNumber! = 0
    @objc dynamic var viewCount: NSNumber! = 0
    @objc dynamic var date: Date!
    @objc dynamic var text: String!
    
    // relationships
    @objc dynamic var item: BMItem?
    let relatedItems: List<BMItem> = List<BMItem>()
    
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


