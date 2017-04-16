//
//  Pomo.swift
//  FlexPomo
//
//  Created by Sebastian Hojas on 16/04/2017.
//  Copyright © 2017 Sebastian Hojas. All rights reserved.
//

import Foundation

protocol Pomo: CustomStringConvertible {
    var start: Date { get }
    var duration: TimeInterval { get }
}

extension Pomo {
    
    var description: String {
        return Self.formatter.string(from: Date(timeIntervalSince1970: duration))
    }
    
    private static var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "mm:ss"
        return formatter
    }
}
