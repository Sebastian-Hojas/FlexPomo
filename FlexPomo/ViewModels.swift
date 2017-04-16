//
//  ViewModels.swift
//  FlexPomo
//
//  Created by Sebastian Hojas on 16/04/2017.
//  Copyright © 2017 Sebastian Hojas. All rights reserved.
//

import Foundation

class ViewModels {
    
    static var shared = ViewModels()

    let pomoViewModel: PomoViewModel
    let statusBarViewModel: StatusBarViewModel
    
    private init() {
        let pomoViewModel = PomoViewModel()
        let statusBarViewModel = StatusBarViewModel(pomoViewModel: pomoViewModel)
        
        self.pomoViewModel = pomoViewModel
        self.statusBarViewModel = statusBarViewModel
    }
}
