//
//  FlexPomoTests.swift
//  FlexPomoTests
//
//  Created by Sebastian Hojas on 11/01/2017.
//  Copyright © 2017 Sebastian Hojas. All rights reserved.
//

import XCTest
@testable import FlexPomo

class FlexPomoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPomo() {
        let start = Date(timeIntervalSinceNow: -2)
        let end = Date(timeIntervalSinceNow: 60)
        XCTAssert(FinishedPomo(start: start, end: end).description == "01:02")
        XCTAssert(ActivePomo(start: start).description == "00:02")
        XCTAssert(ActivePomo(start: nil).description == "00:00")
    }
}
