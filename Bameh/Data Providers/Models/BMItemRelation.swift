//
//  BMItemRelation.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 8/26/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

@objc class BMItemRelation: Object {
    
    @objc dynamic var id: NSNumber! = 1
    
    // relationships
    @objc dynamic var first: BMItem!
    @objc dynamic var second: BMItem!
    @objc dynamic var type: BMItemRelationType!

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

