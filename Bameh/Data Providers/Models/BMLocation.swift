//
//  BMLocation.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 8/26/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

@objc class BMLocation: Object {
    
    @objc dynamic var id: NSNumber! = 1
    @objc dynamic var lat: String?
    @objc dynamic var lng: String?
    @objc dynamic var city: String?
    @objc dynamic var state_Province: String?
    @objc dynamic var details: String?
    
    // relationships
    @objc dynamic var country: BMCountry?

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
