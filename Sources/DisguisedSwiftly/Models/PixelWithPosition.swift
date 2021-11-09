//
//  PixelWithPosition.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 28/10/2021.
//

import Foundation

public struct PixelWithPosition {
    // swiftlint:disable identifier_name
    public let x: Int
    // swiftlint:disable identifier_name
    public let y: Int

    public var red: UInt8, green: UInt8, blue: UInt8
    
    var description: String {
        return "(\(x):\(y)), (r:\(red), g:\(green), b:\(blue))"
    }

    public init(x: Int, y: Int, red: UInt8, green: UInt8, blue: UInt8 ) {
        self.x = x
        self.y = y
        self.red = red
        self.green = green
        self.blue = blue
    }
}
