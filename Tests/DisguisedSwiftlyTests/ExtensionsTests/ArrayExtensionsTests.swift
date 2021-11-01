//
//  ArrayExtensionsTests.swift
//
//
//  Created by Łukasz Stachnik on 01/11/2021.
//

import XCTest
@testable import DisguisedSwiftly

final class ArrayExtensionsTests: XCTestCase {

    var testingArray: Array<String> = []

    override func setUp() {
        testingArray =  ["Test1", "Test2", "Test3"]
    }
    
    func testReplace() throws {
        XCTAssertEqual(testingArray, ["Test1", "Test2", "Test3"])
        
        testingArray.replace("Test1", with: "TestReplaced")
        
        XCTAssertEqual(testingArray, ["TestReplaced", "Test2", "Test3"])
        XCTAssertFalse(testingArray.replace("Test1", with: "TestReplaced"))
    }
}
