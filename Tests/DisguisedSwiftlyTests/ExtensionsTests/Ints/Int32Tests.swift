//
//  Int32Tests.swift
//
//
//  Created by Lukasz Stachnik on 01/11/2021.
//

import XCTest
@testable import DisguisedSwiftly

final class Int32Tests: XCTestCase {

    var testingInt: Int32 = 0

    override func setUp() {
        testingInt = 0b1111111111111111111111111111111
    }

    func testIntGettingBits() throws {
        XCTAssertEqual(testingInt.b0, 1, "0 bit should be equal 1")
        XCTAssertEqual(testingInt.b1, 1, "1 bit should be equal 1")
        XCTAssertEqual(testingInt.b2, 1, "2 bit should be equal 1")
        XCTAssertEqual(testingInt.b3, 1, "3 bit should be equal 1")
        XCTAssertEqual(testingInt.b4, 1, "4 bit should be equal 1")
        XCTAssertEqual(testingInt.b5, 1, "5 bit should be equal 1")
        XCTAssertEqual(testingInt.b6, 1, "6 bit should be equal 1")
        XCTAssertEqual(testingInt.b7, 1, "7 bit should be equal 1")
    }

    func testIntSettingBits() throws {
        XCTAssertEqual(testingInt, Int32.max)

        testingInt.setb0(0)
        testingInt.setb1(0)

        XCTAssertEqual(testingInt.b0, 0)
        XCTAssertEqual(testingInt.b1, 0)
        XCTAssertEqual(testingInt, 2147483644)

        testingInt = 0b0000111100001111
        XCTAssertEqual(testingInt, 3855)
    }

    func testIntSubscript() throws {
        XCTAssertEqual(testingInt[0], 255) //11111111
        XCTAssertEqual(testingInt[1], 255) //11111111
        XCTAssertEqual(testingInt[2], 255) //11111111
        XCTAssertEqual(testingInt[3], 127) //01111111
    }

}
