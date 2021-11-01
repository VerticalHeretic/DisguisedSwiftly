//
//  String.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 28/10/2021.
//

import Foundation

extension String {
    public func int8Array() -> [Int8] {
        return Array(self.utf8).map { Int8(bitPattern: $0)}
    }

    public func uint8Array() -> [UInt8] {
        return [UInt8](self.utf8)
    }
}
