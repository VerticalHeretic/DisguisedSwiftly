//
//  Int16Tests.swift
//  
//
//  Created by Lukasz Stachnik on 01/11/2021.
//

import XCTest
@testable import DisguisedSwiftly

final class Int16Tests: XCTestCase {

    var testingInt: Int16 = 0

    override func setUp() {
        testingInt = 0b00000010
    }

    func testIntGettingBits() throws {
        XCTAssertEqual(testingInt.b0, 0, "0 bit should be equal 0")
        XCTAssertEqual(testingInt.b1, 1, "1 bit should be equal 1")
        XCTAssertEqual(testingInt.b2, 0, "2 bit should be equal 0")
        XCTAssertEqual(testingInt.b3, 0, "3 bit should be equal 0")
        XCTAssertEqual(testingInt.b4, 0, "4 bit should be equal 0")
        XCTAssertEqual(testingInt.b5, 0, "5 bit should be equal 0")
        XCTAssertEqual(testingInt.b6, 0, "6 bit should be equal 0")
        XCTAssertEqual(testingInt.b7, 0, "7 bit should be equal 0")
    }

    func testIntSettingBits() throws {
        XCTAssertEqual(testingInt, 2)

        testingInt = testingInt.setb0(1)
        testingInt = testingInt.setb1(0)

        XCTAssertEqual(testingInt.b0, 1)
        XCTAssertEqual(testingInt.b1, 0)
        XCTAssertEqual(testingInt, 1)

        testingInt = 0b0000111100001111
        XCTAssertEqual(testingInt, 3855)
    }

    func testIntSubscript() throws {
        XCTAssertEqual(testingInt[0], 2)
        XCTAssertEqual(testingInt[1], 0)
    }

}
