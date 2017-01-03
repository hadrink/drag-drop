//
//  MyCoach_LockerTests.swift
//  MyCoach LockerTests
//
//  Created by Rplay on 03/01/2017.
//  Copyright © 2017 rplay. All rights reserved.
//

import XCTest
@testable import MyCoach_Locker

class MyCoach_LockerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testUpdatePositionsOfAFootballPlayer() {
        let footballPlayerPositions: Array<FootballPosition> = [.att, .moc]
        let footballPlayer = FootballPlayer(name: "Michel", age: 44, positions: footballPlayerPositions)
        let newFootballPlayerPostions: Array<FootballPosition> = [.att, .att]
        
        footballPlayer.updatePositions(positions: newFootballPlayerPostions)
        XCTAssertEqual(footballPlayer.positions as! Array<FootballPosition>, newFootballPlayerPostions)
    }
    
}
