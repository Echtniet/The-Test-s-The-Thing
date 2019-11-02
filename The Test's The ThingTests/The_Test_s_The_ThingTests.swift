//
//  The_Test_s_The_ThingTests.swift
//  The Test's The ThingTests
//
//  Created by Student on 11/2/19.
//  Copyright © 2019 Student. All rights reserved.
//

import XCTest
@testable import The_Test_s_The_Thing

class The_Test_s_The_ThingTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumWords() {
        assert(Scholar.scholar.corpus.count != 0) // should this be == or != because == fails since the number of words is not equal to 0
        assert(Scholar.scholar.corpus.count == 15642)
    }

    func testCounts() {
        assert(Scholar.scholar["feasting"] != nil)
        assert(Scholar.scholar["feasting"]! < 25)
        assert(Scholar.scholar["feasting"]! == 3)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            Scholar.scholar// Put the code you want to measure the time of here.
        }
    }

}
