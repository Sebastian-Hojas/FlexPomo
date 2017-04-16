//
//  ActivePomo.swift
//  FlexPomo
//
//  Created by Sebastian Hojas on 16/04/2017.
//  Copyright © 2017 Sebastian Hojas. All rights reserved.
//

import Foundation

struct ActivePomo: Pomo {
    
    let start: Date
    
    init(start: Date?) {
        self.start = start ?? Date()
    }
    
    var status: PomoStatus {
        return PomoStatus.from(duration: duration)
    }
    
    var duration: TimeInterval {
        return -start.timeIntervalSinceNow
    }
    
}
