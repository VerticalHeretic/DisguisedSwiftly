//
//  ImageModifier.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 28/10/2021.
//

import Foundation
import UIKit

class ImageModifier {

    public enum Modifier {
        case increaseContrast
        case grayscale
        case stego
    }

    func applyModifier(_ filter: Modifier, to image: UIImage, rgbValues: [PixelWithPosition]) -> UIImage? {

        guard let cgImage = image.cgImage else { return nil }

        // Redraw image for correct pixel format
        var colorSpace = CGColorSpaceCreateDeviceRGB()

        var bitmapInfo: UInt32 = CGBitmapInfo.byteOrder32Big.rawValue

        bitmapInfo |= CGImageAlphaInfo.premultipliedLast.rawValue & CGBitmapInfo.alphaInfoMask.rawValue // bitwise or

        let width = Int(image.size.width)
        let height = Int(image.size.height)
        var bytesPerRow = width * 4

        let imageData = UnsafeMutablePointer<Pixel>.allocate(capacity: width * height)

        guard let imageContext = CGContext(
            data: imageData,
            width: width,
            height: height,
            bitsPerComponent: 8,
            bytesPerRow: bytesPerRow,
            space: colorSpace,
            bitmapInfo: bitmapInfo
        ) else { return nil }

        imageContext.draw(cgImage, in: CGRect(x: 0, y: 0, width: width, height: height))

        let pixels = UnsafeMutableBufferPointer<Pixel>(start: imageData, count: width * height)

        var totalRed = 0
        var totalGreen = 0
        var totalBlue = 0
        let pixelArea = width * height

        // swiftlint:disable identifier_name
        for y in 0..<height {
            // swiftlint:disable identifier_name
            for x in 0..<width {
                let index = y * width + x
                let pixel = pixels[index]

                totalRed += Int(pixel.red)
                totalGreen += Int(pixel.green)
                totalBlue += Int(pixel.blue)
            }
        }

        let avgRed = totalRed / pixelArea
        let avgGreen = totalGreen / pixelArea
        let avgBlue = totalBlue / pixelArea

        // swiftlint:disable identifier_name
        for y in 0..<height {
            // swiftlint:disable identifier_name
            for x in 0..<width {
                let index = y * width + x
                var pixel = pixels[index]

                let redDelta = Int(pixel.red) - avgRed
                let greenDelta = Int(pixel.green) - avgGreen
                let blueDelta = Int(pixel.blue) - avgBlue

                switch filter {
                case .increaseContrast:
                    pixel.red = UInt8(max(min(255, avgRed + 2 * redDelta), 0))
                    pixel.blue = UInt8(max(min(255, avgBlue + 2 * blueDelta), 0))
                    pixel.green = UInt8(max(min(255, avgGreen + 2 * greenDelta), 0))
                case .grayscale:
                    let avg = Int(Double(Int(pixel.red) + Int(pixel.blue) + Int(pixel.green))/3.0)
                    let pixelColor = UInt8(avg)
                    pixel.red = pixelColor
                    pixel.blue = pixelColor
                    pixel.green = pixelColor
                case .stego:
                    if index > rgbValues.count - 1{
                        pixel.red = pixel.red
                        pixel.blue = pixel.blue
                        pixel.green = pixel.green
                    } else {
                        pixel.red = rgbValues[index].red
                        pixel.blue = rgbValues[index].blue
                        pixel.green = rgbValues[index].green
                    }
                }
                pixels[index] = pixel
            }
        }

        colorSpace = CGColorSpaceCreateDeviceRGB()
        bitmapInfo = CGBitmapInfo.byteOrder32Big.rawValue
        bitmapInfo |= CGImageAlphaInfo.premultipliedLast.rawValue & CGBitmapInfo.alphaInfoMask.rawValue

        bytesPerRow = width * 4

        guard let context = CGContext(
            data: pixels.baseAddress,
            width: width,
            height: height,
            bitsPerComponent: 8,
            bytesPerRow: bytesPerRow,
            space: colorSpace,
            bitmapInfo: bitmapInfo,
            releaseCallback: nil,
            releaseInfo: nil
        ) else { return nil }

        guard let newCGImage = context.makeImage() else { return nil }

        return UIImage(cgImage: newCGImage)
    }
}
