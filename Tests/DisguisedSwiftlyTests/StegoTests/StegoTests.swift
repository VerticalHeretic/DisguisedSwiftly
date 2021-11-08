//
//  File.swift
//  
//
//  Created by Lukasz Stachnik on 03/11/2021.
//

import XCTest
@testable import DisguisedSwiftly

final class StegoTests: XCTestCase {

    let stegoTester = Stego()
    
    func testEncodeTextInImage() {
        let size = CGSize(width: 100, height: 100)
        var testImage = UIGraphicsImageRenderer(size: size).image { rendererContext in
            UIColor.red.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }

        testImage = stegoTester.encodeTextInImage(with: "test", image: testImage) { value in
            XCTAssertTrue(value)
        }!
    }
    
    func testDecodeTextInImage() {
        let size = CGSize(width: 100, height: 100)
        var testImage = UIGraphicsImageRenderer(size: size).image { rendererContext in
            UIColor.red.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }

        testImage = stegoTester.encodeTextInImage(with: "test", image: testImage) { value in
            XCTAssertTrue(value)
        }!
        
        XCTAssertEqual(stegoTester.decodeTextInImage(image: testImage, finished: { value in
            XCTAssertTrue(value)
        }), "test")
    }
    
    func testGetRGBValuesWithPositionFromImageWithoutText() {
        let size = CGSize(width: 100, height: 100)
        var testImage = UIGraphicsImageRenderer(size: size).image { rendererContext in
            UIColor.red.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
        
        let testPixelWithPositionArray = stegoTester.getRGBValuesWithPosionFromImage(image: testImage)
        XCTAssertEqual(testPixelWithPositionArray.count, 100)
    }
    
//    func testGetRGBValuesWithPositionFromImageWithText() {
//        let size = CGSize(width: 1000, height: 1000)
//        var testImage = UIGraphicsImageRenderer(size: size).image { rendererContext in
//            UIColor.red.setFill()
//            rendererContext.fill(CGRect(origin: .zero, size: size))
//        }
//        let testMessage = "test"
//        
//        let textPixelWithPositionArray = stegoTester.getRGBValuesWithPositionFromImage(image: testImage, for: testMessage.count)
//        
//    }

}
