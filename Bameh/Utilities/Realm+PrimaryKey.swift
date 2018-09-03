//
//  Realm+PrimaryKey.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 8/27/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import RealmSwift

extension Realm {
    func objectsForPrimaryKeys<T: Object, K: AnyObject>(type: T.Type, keys: [K]) -> Results<T> {
        return objects(type).filter("\(type.primaryKey) IN %@", keys)
    }
}
