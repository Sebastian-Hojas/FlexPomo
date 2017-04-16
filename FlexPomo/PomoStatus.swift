//
//  PomoStatus.swift
//  FlexPomo
//
//  Created by Sebastian Hojas on 16/04/2017.
//  Copyright © 2017 Sebastian Hojas. All rights reserved.
//

import Foundation

enum PomoStatus {
    case normal
    case paused
    case warning
    case error
    
    static func from(duration: TimeInterval) -> PomoStatus {
        switch duration {
        case let time where time < 60*20: return .normal
        case let time where time < 60*30: return .warning
        default: return .error
        }
    }
}
