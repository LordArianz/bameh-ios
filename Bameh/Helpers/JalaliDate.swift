//
//  JalaliDate.swift
//  Bameh
//
//  Created by Morteza Ezzabady on 7/15/18.
//  Copyright © 2018 Morteza Ezzabady. All rights reserved.
//

import Foundation

class JalaliDate {
    
    let date: Date
    
    let month: Int
    let day: Int
    let year: Int
    
    init(date: Date) {
        self.date = date
        let destCalendar: Calendar = Calendar(identifier: .persian)
        let components = destCalendar.dateComponents([.day, .year, .month], from: self.date)
        month = components.month!
        day = components.day!
        year = components.year!
    }
    convenience init() {
        self.init(date: Date(timeIntervalSinceNow: 0))
    }
    
}
