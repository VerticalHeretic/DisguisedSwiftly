//
//  StringExtensionsTests.swift
//  
//
//  Created by Łukasz Stachnik on 01/11/2021.
//

import XCTest
@testable import DisguisedSwiftly

final class StringExtensionsTests: XCTestCase {

    var testingString: String = "ZIOBRO"

    func testInt8Array() throws {
        XCTAssertEqual(testingString.int8Array(), [90, 73, 79, 66, 82, 79])
        XCTAssertEqual(testingString.int8Array().self, [90, 73, 79, 66, 82, 79].self)
    }

    func testUInt8Array() throws {
        XCTAssertEqual(testingString.uint8Array(), [90, 73, 79, 66, 82, 79])
        XCTAssertEqual(testingString.uint8Array().self, [90, 73, 79, 66, 82, 79].self)
    }
}
