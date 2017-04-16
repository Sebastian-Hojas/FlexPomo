//
//  StatusBarViewController.swift
//  FlexPomo
//
//  Created by Sebastian Hojas on 11/01/2017.
//  Copyright © 2017 Sebastian Hojas. All rights reserved.
//

import Foundation
import Cocoa
import ReactiveCocoa
import ReactiveSwift

class StatusBarViewController: NSObject
{
    let FPS = 4.0
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    var statusBarViewModel: StatusBarViewModel?
    
    override func awakeFromNib() {
        
        statusBarViewModel = ViewModels.shared.statusBarViewModel
        statusItem.button?.action = #selector(StatusBarViewController.statusBarClicked(sender:))
        statusItem.button?.target = self
        statusItem.button?.sendAction(on: [.leftMouseUp, .rightMouseUp])
        
        timer(interval: .milliseconds(Int(1000.0/FPS)), on: QueueScheduler(qos: .background))
            .throttle(1.0/FPS, on: QueueScheduler(qos: .background))
            .take(during: reactive.lifetime)
            .observe(on: UIScheduler())
            .startWithValues { [weak self] _ in
                let string = self?.statusBarViewModel?.title ?? "X"
                let attributedString = NSMutableAttributedString(string: string)
                attributedString.addAttribute(NSKernAttributeName, value: 1, range: NSMakeRange(0, string.characters.count))
                self?.statusItem.button?.attributedTitle = attributedString
            }
    }
    
    func statusBarClicked(sender: NSStatusBarButton) {
        guard let event = NSApp?.currentEvent else { return }
        switch event.type {
        case .leftMouseUp:
            statusBarViewModel?.action()
        case .rightMouseUp:
            print("Right click")
        default:
            break
        }
    }
}
