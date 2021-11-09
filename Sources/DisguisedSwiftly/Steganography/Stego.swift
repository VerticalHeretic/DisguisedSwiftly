//
//  Stego.swift
//  
//  Created by Lukasz Stachnik on 03/11/2021.
//

import Foundation
import UIKit

public enum StegoProgress {
    case ended
    case working
    case failed
}

public final class Stego: StegoEncoder, StegoDecoder {

    public init() {

    }

    let imageModifier: ImageModifier = ImageModifier()

    internal func decodeTextInImage(image: UIImage, finished: (Bool) -> Void) -> String {
        let pixelRBGValues = getRGBValuesWithPosionFromImage(image: image)
        var decodedText = ""
        var iterator = 0
        var bytesArray: [UInt8] = []
        var placeholder: UInt8 = 0b00000000
        for pixel in pixelRBGValues {
            if decodedText.contains("|") {
                break
            }

            if iterator == 7 {
                switchByIndex(index: iterator, byte: &placeholder, to: pixel.red.b0)
                bytesArray.append(placeholder)
                decodedText = String(decoding: bytesArray, as: UTF8.self)
                iterator = 0
                placeholder = 0b00000000
            } else {
                switchByIndex(index: iterator, byte: &placeholder, to: pixel.red.b0)
                iterator += 1
            }

        }

        finished(true)
        decodedText.removeLast()
        return decodedText
    }
    
    /// Decodes image encoded with text and retrunes the message
    /// - Parameters:
    ///   - image: UIImage in which message is encoded
    ///   - progress: Progress completion handler
    /// - Returns: Decoded message from the image
    public func decodeTextInImage(image: UIImage, progress: (StegoProgress) -> ()) -> String {
        progress(.working)
        let heightInPoints = image.size.height
        let widthInPoints = image.size.width
        
        var decodedText = ""
        var iterator = 0
        var bytesArray: [UInt8] = []
        var placeholder: UInt8 = 0b00000000
        
        // swiftlint:disable identifier_name
        for y in 0..<Int(heightInPoints) {
            // swiftlint:disable identifier_name
            for x in 0..<Int(widthInPoints) {
                if let cgImage = image.cgImage, let
                    rgbValue = cgImage.rgbValuesForPixel(posY: y, posX: x) {
                    
                    if decodedText.contains("|") {
                        break
                    }
                    
                    if iterator == 7 {
                        switchByIndex(index: iterator, byte: &placeholder, to: rgbValue.r.b0)
                        bytesArray.append(placeholder)
                        decodedText = String(decoding: bytesArray, as: UTF8.self)
                        iterator = 0
                        placeholder = 0b00000000
                    } else {
                        switchByIndex(index: iterator, byte: &placeholder, to: rgbValue.r.b0)
                        iterator += 1
                    }
                } else {
                    progress(.failed)
                }
            }
        }
        
        decodedText.removeLast()
        progress(.ended)
        return decodedText
    }
    
    /// Encodes message in image last bits of red color
    /// - Parameters:
    ///   - text: Text to encode in to image
    ///   - image: Image in which to encode the text
    ///   - progress: Progress in encoding the message completion handler
    /// - Returns: Encoded with the text UIImage?
    public func encodeTextInImage(with text: String, image: UIImage, progress: (StegoProgress) -> ()) -> UIImage? {
        progress(.working)
        let encodingText = text + "|"
        var imageRGBPixelValues = getRGBValuesWithPosionFromImageForText(image: image, text: encodingText)
        var iteratorX = 0
        var iteratorY = 0
        let encodedTextBitsArray = encodingText.uint8Array()
        let maxes = (len: imageRGBPixelValues.last?.x, height: imageRGBPixelValues.last?.y)

        for letter in encodedTextBitsArray {
            for index in 0..<letter.bitWidth {
                switch index {
                case 0:
                    changeLSB(letterBit: letter.b7, pixelsArray: &imageRGBPixelValues, positionX: iteratorX, positionY: iteratorY)
                    if iteratorX == maxes.len {
                        iteratorY += 1
                        iteratorX = 0
                    } else {
                        iteratorX += 1
                    }
                case 1:
                    changeLSB(letterBit: letter.b6, pixelsArray: &imageRGBPixelValues, positionX: iteratorX, positionY: iteratorY)
                    if iteratorX == maxes.len {
                        iteratorY += 1
                        iteratorX = 0
                    } else {
                        iteratorX += 1
                    }
                case 2:
                    changeLSB(letterBit: letter.b5, pixelsArray: &imageRGBPixelValues, positionX: iteratorX, positionY: iteratorY)
                    if iteratorX == maxes.len {
                        iteratorY += 1
                        iteratorX = 0
                    } else {
                        iteratorX += 1
                    }
                case 3:
                    changeLSB(letterBit: letter.b4, pixelsArray: &imageRGBPixelValues, positionX: iteratorX, positionY: iteratorY)
                    if iteratorX == maxes.len {
                        iteratorY += 1
                        iteratorX = 0
                    } else {
                        iteratorX += 1
                    }
                case 4:
                    changeLSB(letterBit: letter.b3, pixelsArray: &imageRGBPixelValues, positionX: iteratorX, positionY: iteratorY)
                    if iteratorX == maxes.len {
                        iteratorY += 1
                        iteratorX = 0
                    } else {
                        iteratorX += 1
                    }
                case 5:
                    changeLSB(letterBit: letter.b2, pixelsArray: &imageRGBPixelValues, positionX: iteratorX, positionY: iteratorY)
                    if iteratorX == maxes.len {
                        iteratorY += 1
                        iteratorX = 0
                    } else {
                        iteratorX += 1
                    }
                case 6:
                    changeLSB(letterBit: letter.b1, pixelsArray: &imageRGBPixelValues, positionX: iteratorX, positionY: iteratorY)
                    if iteratorX == maxes.len {
                        iteratorY += 1
                        iteratorX = 0
                    } else {
                        iteratorX += 1
                    }
                case 7:
                    changeLSB(letterBit: letter.b0, pixelsArray: &imageRGBPixelValues, positionX: iteratorX, positionY: iteratorY)
                    if iteratorX == maxes.len {
                        iteratorY += 1
                        iteratorX = 0
                    } else {
                        iteratorX += 1
                    }
                default:
                    break
                }
            }
        }

        progress(.ended)
        return imageModifier.applyModifier(.stego, to: image, rgbValues: imageRGBPixelValues)
    }
}

extension Stego {

    internal func getRGBValuesWithPosionFromImage(image: UIImage) -> [PixelWithPosition] {
       let heightInPoints = image.size.height
       let widthInPoints = image.size.width
        
       var pixelRBGValues: [PixelWithPosition] = []
        // swiftlint:disable identifier_name
       for y in 0..<Int(heightInPoints) {
           // swiftlint:disable identifier_name
          for x in 0..<Int(widthInPoints) {
             if let cgImage = image.cgImage, let
                    rgbValue = cgImage.rgbValuesForPixel(posY: y, posX: x) {
                let pixelWithRgb = PixelWithPosition(x: x, y: y, red: rgbValue.r, green: rgbValue.g, blue: rgbValue.b)
                pixelRBGValues.append(pixelWithRgb)
             }
          }
       }

       return pixelRBGValues
    }
    
    internal func getRGBValuesWithPosionFromImageForText(image: UIImage, text: String) -> [PixelWithPosition] {
       let heightInPoints = image.size.height
       let widthInPoints = image.size.width
        
        
       var pixelRBGValues: [PixelWithPosition] = []
        // swiftlint:disable identifier_name
       for y in 0..<Int(heightInPoints) {
           // swiftlint:disable identifier_name
          for x in 0..<Int(widthInPoints) {
             if let cgImage = image.cgImage, let
                    rgbValue = cgImage.rgbValuesForPixel(posY: y, posX: x) {
                let pixelWithRgb = PixelWithPosition(x: x, y: y, red: rgbValue.r, green: rgbValue.g, blue: rgbValue.b)
                pixelRBGValues.append(pixelWithRgb)
             }
              
              if pixelRBGValues.count == text.count * 8 {
                  return pixelRBGValues
              }
          }
       }

       return pixelRBGValues
    }

    private func changeLSB(letterBit: UInt8, pixelsArray: inout [PixelWithPosition], positionX: Int, positionY: Int) {
       if let pixelPos = pixelsArray.firstIndex(where: { $0.x == positionX && $0.y == positionY}) {
          var newPixel = pixelsArray[pixelPos]
          newPixel.red.setb0(letterBit)
          pixelsArray[pixelPos] = newPixel
       }
    }

    /// Returns array of Bytes from Image for every pixel
    /// - Parameter imageData: Data from UIImage.pngData
    /// - Returns: Array of Bytes for every pixel in image
    private func getArrayOfBytesFromImage(imageData: NSData) -> [UInt8] {

        // the number of elements:
        let count = imageData.length / MemoryLayout<Int8>.size

        // create array of appropriate length:
        var bytes = [UInt8](repeating: 0, count: count)

        // copy bytes into array
        imageData.getBytes(&bytes, length: count * MemoryLayout<Int8>.size)

        var byteArray: Array = [UInt8]()

        for index in 0 ..< count {
           byteArray.append(bytes[index])
        }

        return byteArray
     }

    private func pad(string: String, toSize: Int) -> String {
       var padded = string
       for _ in 0..<(toSize - string.count) {
          padded = "0" + padded
       }
       return padded
    }

    private func switchByIndex(index: Int, byte: inout UInt8, to: UInt8) {
        switch index {
        case 0:
            byte.setb7(to)
        case 1:
            byte.setb6(to)
        case 2:
            byte.setb5(to)
        case 3:
            byte.setb4(to)
        case 4:
            byte.setb3(to)
        case 5:
            byte.setb2(to)
        case 6:
            byte.setb1(to)
        case 7:
            byte.setb0(to)
        default:
            break
        }
    }

}
