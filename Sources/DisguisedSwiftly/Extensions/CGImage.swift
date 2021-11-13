//
//  CGImage.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 26/10/2021.
//

import CoreGraphics

extension CGImage {

    // swiftlint:disable large_tuple
    /// Returns values of Red, Green and Blue for given position X and Y of the CGImage
    /// - Parameters:
    ///   - posY: X position on Image
    ///   - posX: Y position on Image
    /// - Returns: Red, Green and Blue values in Unsigned8Int values
    public func rgbValuesForPixel(posY: Int, posX: Int) -> (r: UInt8, g: UInt8, b: UInt8)? {
        guard let pixelData = dataProvider?.data,
            let data = CFDataGetBytePtr(pixelData) else { return nil }

        let pixelInfo = ((width  * posY) + posX ) * 4

       let red = UInt8(exactly: data[pixelInfo]) ?? 0        // If you need this info, enable it
       let green = UInt8(exactly: data[(pixelInfo + 1)]) ?? 0 // If you need this info, enable it
       let blue = UInt8(exactly: data[pixelInfo + 2]) ?? 0   // If you need this info, enable it
//       let alpha = Int8(exactly: data[pixelInfo + 3]) ?? 0  // I need only this info for my maze game

        return (red, green, blue)
    }
}
