//
//  PomoViewModel.swift
//  FlexPomo
//
//  Created by Sebastian Hojas on 16/04/2017.
//  Copyright © 2017 Sebastian Hojas. All rights reserved.
//

import Foundation
import ReactiveSwift

class PomoViewModel {
    
    var history = [FinishedPomo]()
    var currentPomo: ActivePomo?
    
    func action() {
        switch currentPomo {
        case .none:
            newPomo()
        case .some(let pomo):
            endPomo(pomo)
        }
    }
    
    private func newPomo() {
        currentPomo = ActivePomo(start: nil)
    }
    
    private func endPomo(_ pomo: ActivePomo) {
        history.append(FinishedPomo(from: pomo))
        currentPomo = nil
    }

}
