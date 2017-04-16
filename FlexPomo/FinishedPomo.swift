//
//  FinishedPomo.swift
//  FlexPomo
//
//  Created by Sebastian Hojas on 16/04/2017.
//  Copyright © 2017 Sebastian Hojas. All rights reserved.
//

import Foundation

struct FinishedPomo: Pomo {
    let start: Date
    let end: Date
    
    init(from active: ActivePomo) {
        self.start = active.start
        self.end = Date()
    }
    
    init(start: Date, end: Date) {
        self.start = start
        self.end = end
    }
    
    var duration: TimeInterval {
        return -start.timeIntervalSince(end)
    }

}
