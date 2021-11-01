//
//  UIntTests.swift
//
//
//  Created by Łukasz Stachnik on 01/11/2021.
//

import XCTest
@testable import DisguisedSwiftly

final class UIntTests: XCTestCase {

    var testingInt: UInt = 0

    override func setUp() {
        testingInt = 0b11110000
    }

    func testIntGettingBits() throws {
        XCTAssertEqual(testingInt.b0, 0, "0 bit should be equal 1")
        XCTAssertEqual(testingInt.b1, 0, "1 bit should be equal 1")
        XCTAssertEqual(testingInt.b2, 0, "2 bit should be equal 0")
        XCTAssertEqual(testingInt.b3, 0, "3 bit should be equal 0")
        XCTAssertEqual(testingInt.b4, 1, "4 bit should be equal 0")
        XCTAssertEqual(testingInt.b5, 1, "5 bit should be equal 0")
        XCTAssertEqual(testingInt.b6, 1, "6 bit should be equal 0")
        XCTAssertEqual(testingInt.b7, 1, "7 bit should be equal 0")
    }

    func testIntSettingBits() throws {
        XCTAssertEqual(testingInt, 240)

        testingInt.setb0(0)
        testingInt.setb1(71)

        XCTAssertEqual(testingInt.b0, 0)
        XCTAssertEqual(testingInt.b1, 1)
        XCTAssertEqual(testingInt, 242)

        testingInt = 0b11111111
        XCTAssertEqual(testingInt, 255)
    }

    func testIntSubscript() throws {
        XCTAssertEqual(testingInt[0], 240)
        XCTAssertEqual(testingInt[1], 0)
        XCTAssertEqual(testingInt[2], 0)
        XCTAssertEqual(testingInt[3], 0)
        XCTAssertEqual(testingInt[4], 0)
        XCTAssertEqual(testingInt[5], 0)
        XCTAssertEqual(testingInt[6], 0)
        XCTAssertEqual(testingInt[7], 0)
    }

}
