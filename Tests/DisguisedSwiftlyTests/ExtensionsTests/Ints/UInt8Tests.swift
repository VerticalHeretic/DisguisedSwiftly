//
//  UInt8Tests.swift
//
//
//  Created by Łukasz Stachnik on 01/11/2021.
//

import XCTest
@testable import DisguisedSwiftly

final class UInt8Tests: XCTestCase {

    var testingInt: UInt8 = 0

    override func setUp() {
        testingInt = 0b00000011
    }

    func testIntGettingBits() throws {
        XCTAssertEqual(testingInt.b0, 1, "0 bit should be equal 1")
        XCTAssertEqual(testingInt.b1, 1, "1 bit should be equal 1")
        XCTAssertEqual(testingInt.b2, 0, "2 bit should be equal 0")
        XCTAssertEqual(testingInt.b3, 0, "3 bit should be equal 0")
        XCTAssertEqual(testingInt.b4, 0, "4 bit should be equal 0")
        XCTAssertEqual(testingInt.b5, 0, "5 bit should be equal 0")
        XCTAssertEqual(testingInt.b6, 0, "6 bit should be equal 0")
        XCTAssertEqual(testingInt.b7, 0, "7 bit should be equal 0")
    }

    func testIntSettingBits() throws {
        XCTAssertEqual(testingInt, 3)

        testingInt.setb0(0)
        testingInt.setb1(71)
        XCTAssertEqual(testingInt.b0, 0)
        XCTAssertEqual(testingInt.b1, 1)
        XCTAssertEqual(testingInt, 2)

        testingInt = 0b00000000
        XCTAssertEqual(testingInt, 0)
        
        testingInt.setb7(0)
        testingInt.setb6(1)
        testingInt.setb5(0)
        testingInt.setb4(0)
        testingInt.setb3(0)
        testingInt.setb2(1)
        testingInt.setb1(0)
        testingInt.setb0(1)
        XCTAssertEqual(testingInt, 69)
    }

    func testIntSubscript() throws {
        XCTAssertEqual(testingInt[0], 3)
    }

}
