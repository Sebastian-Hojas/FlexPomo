//
//  StatusBarViewModel.swift
//  FlexPomo
//
//  Created by Sebastian Hojas on 16/04/2017.
//  Copyright © 2017 Sebastian Hojas. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result

class StatusBarViewModel {
    
    weak private var pomoViewModel: PomoViewModel?
    
    init(pomoViewModel: PomoViewModel) {
        self.pomoViewModel = pomoViewModel
    }
    
    var title: String? {
        return pomoViewModel?.currentPomo.map {
            $0.status.description + $0.description
        }
    }
    
    public func action() {
        pomoViewModel?.action()
    }
    
}

extension PomoStatus: CustomStringConvertible {
    
    var description: String {
        switch self {
        case .normal: return ""
        case .error: return "!! "
        case .warning: return "! "
        case .paused: return "> "
        }
    }
}
