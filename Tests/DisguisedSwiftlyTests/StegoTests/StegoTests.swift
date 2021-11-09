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

        testImage = stegoTester.encodeTextInImage(with: "test", image: testImage) { progress in
            switch progress {
            case .ended:
                XCTAssertEqual(progress, StegoProgress.ended)
            case .working:
                break
            case .failed:
                XCTFail()
            }
        }!
    }

    func testGetRGBValuesWithPositionFromImage() {
        let size = CGSize(width: 100, height: 100)
        let testImage = UIGraphicsImageRenderer(size: size).image { rendererContext in
            UIColor.red.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }

        let testPixelWithPositionArray = stegoTester.getRGBValuesWithPosionFromImage(image: testImage)
        XCTAssertEqual(testPixelWithPositionArray.count, 10000)
    }

    func testGetRGBValuesWithPositionFromImageWithBigImages() {
        let size = CGSize(width: 1920, height: 1080)
        let testImage = UIGraphicsImageRenderer(size: size).image { rendererContext in
            UIColor.red.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }

        let testPixelWithPositionArray = stegoTester.getRGBValuesWithPosionFromImage(image: testImage)
        XCTAssertEqual(testPixelWithPositionArray.count, 2073600)
    }

    func testGetRGBValuesWithPositionFromImageWithBiggerImages() {
        let sizeBigger = CGSize(width: 3024, height: 4032)
        let testImage = UIGraphicsImageRenderer(size: sizeBigger).image { rendererContext in
            UIColor.red.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: sizeBigger))
        }

        let testPixelWithPositionArray2 = stegoTester.getRGBValuesWithPosionFromImage(image: testImage)
        XCTAssertEqual(testPixelWithPositionArray2.count, 12192768)
    }
    
    func testGetRGBValuesWithPositionFromImageWithBiggerImagesWithText() {
        let sizeBigger = CGSize(width: 3024, height: 4032)
        let testImage = UIGraphicsImageRenderer(size: sizeBigger).image { rendererContext in
            UIColor.red.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: sizeBigger))
        }

        let testPixelWithPositionArray2 = stegoTester.getRGBValuesWithPosionFromImageForText(image: testImage, text: "test")
        XCTAssertEqual(testPixelWithPositionArray2.count, 32)
    }
    
    func testDecodeTextInImageSinglePixel() {
        let size = CGSize(width: 3024, height: 4032)
        var testImage = UIGraphicsImageRenderer(size: size).image { rendererContext in
            UIColor.red.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }

        testImage = stegoTester.encodeTextInImage(with: "test", image: testImage) { progress in
            switch progress {
            case .ended:
                XCTAssertEqual(progress, StegoProgress.ended)
            case .working:
                break
            case .failed:
                XCTFail()
            }
        }!

        XCTAssertEqual(stegoTester.decodeTextInImage(image: testImage, progress: { progress in
            switch progress {
            case .ended:
                print("success")
            case .working:
                print("working")
            case .failed:
                XCTFail()
            }
        }), "test")
    }
}
