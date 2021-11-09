//
//  Int32Tests.swift
//
//
//  Created by Lukasz Stachnik on 01/11/2021.
//

import XCTest
@testable import DisguisedSwiftly

final class Int64Tests: XCTestCase {

    var testingInt: Int64 = 0

    override func setUp() {
        testingInt = 0b10001010111
    }

    func testIntGettingBits() throws {
        XCTAssertEqual(testingInt.b0, 1, "0 bit should be equal 1")
        XCTAssertEqual(testingInt.b1, 1, "1 bit should be equal 1")
        XCTAssertEqual(testingInt.b2, 1, "2 bit should be equal 1")
        XCTAssertEqual(testingInt.b3, 0, "3 bit should be equal 1")
        XCTAssertEqual(testingInt.b4, 1, "4 bit should be equal 1")
        XCTAssertEqual(testingInt.b5, 0, "5 bit should be equal 1")
        XCTAssertEqual(testingInt.b6, 1, "6 bit should be equal 1")
        XCTAssertEqual(testingInt.b7, 0, "7 bit should be equal 1")
    }

    func testIntSettingBits() throws {
        XCTAssertEqual(testingInt, 1111)

        testingInt.setb0(0)
        testingInt.setb1(0)

        XCTAssertEqual(testingInt.b0, 0)
        XCTAssertEqual(testingInt.b1, 0)
        XCTAssertEqual(testingInt, 1108)

        testingInt = 0b10001011111
        XCTAssertEqual(testingInt, 1119)
    }

    func testIntSubscript() throws {
        XCTAssertEqual(testingInt[0], 87) // 01010111
        XCTAssertEqual(testingInt[1], 4) // 00000100
        XCTAssertEqual(testingInt[2], 0) // 00000000
        XCTAssertEqual(testingInt[3], 0) // 00000000
    }

}
