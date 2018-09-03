//
//  BMPerson.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 8/26/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

@objc class BMPerson: Object {
    
    @objc dynamic var id: NSNumber! = 1
    @objc dynamic var firstName: String!
    @objc dynamic var middleName: String?
    @objc dynamic var lastName: String!
    @objc dynamic var nickName: String?
    @objc dynamic var dead: Bool = false
    
    // relationships
    @objc dynamic var item: BMItem!
    @objc dynamic var locationOfBirth: BMLocation?
    @objc dynamic var locationOfDeath: BMLocation?
    @objc dynamic var nationality: BMCountry?
    @objc dynamic var category: BMCategory!
    let jobs: List<BMJob> = List<BMJob>()
    
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

