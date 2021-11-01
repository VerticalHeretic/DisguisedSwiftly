//
//  String.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 28/10/2021.
//

import Foundation

extension String {
    
    /// Creates array of Int8 values for every character in String
    ///
    ///  **Example Usage**:
    ///  ```
    ///         // will produce output of [90,73,79,66,82,79]
    ///         let stringValues = "ZIOBRO".int8Array()
    ///  ```
    ///
    /// - Returns: Array of Int8 values for every character in String
    public func int8Array() -> [Int8] {
        return Array(self.utf8).map { Int8(bitPattern: $0)}
    }

    /// Creates array of UInt8 values for every character in String
    ///
    ///  **Example Usage**:
    ///  ```
    ///         // will produce output of [90,73,79,66,82,79]
    ///         let stringValues = "ZIOBRO".uint8Array()
    ///  ```
    ///
    /// - Returns: Array of UInt8 values for every character in String
    public func uint8Array() -> [UInt8] {
        return [UInt8](self.utf8)
    }
}
