//
//  UInt8.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 28/10/2021.
//

import Foundation

/**
Extension that adds a few additional functionalities to UInt8:
- toIntN/toUIntN truncating bit pattern conversions
- allOnes
- size
- Byte indexed subscript
*/
extension UInt8 {

    /// Perform a bit pattern truncating conversion to UInt8
    public var toU8: UInt8 {return self}
    /// Perform a bit pattern truncating conversion to Int8
    public var to8: Int8 {return Int8(bitPattern: self)}
    /// Perform a bit pattern truncating conversion to UInt16
    public var toU16: UInt16 {return UInt16(self)}
    /// Perform a bit pattern truncating conversion to Int16
    public var to16: Int16 {return Int16(self)}
    /// Perform a bit pattern truncating conversion to UInt32
    public var toU32: UInt32 {return UInt32(self)}
    /// Perform a bit pattern truncating conversion to Int32
    public var to32: Int32 {return Int32(self)}
    /// Perform a bit pattern truncating conversion to UInt64
    public var toU64: UInt64 {return UInt64(self)}
    /// Perform a bit pattern truncating conversion to Int64
    public var to64: Int64 {return Int64(self)}
    /// Perform a bit pattern truncating conversion to Int
    public var toInt: Int {return Int(bitPattern: UInt(self))}
    /// Perform a bit pattern truncating conversion to UInt
    public var toUInt: UInt {return UInt(self)}

    /// Create bits mask with one
    public func mask(_ bits: UInt8, _ msb: Bool) -> UInt8 {
        if (bits >> 3) == UInt8.size { return UInt8.max }

        let mask = UInt8(truncating: NSDecimalNumber(decimal: (pow(2, bits.toInt) - 1)))

        switch msb {
        case false:
            return mask
        case true:
            let shift = UInt8(UInt8.size << 3) - bits
            return mask << shift
        }
    }

    /// Returns the size of this type (number of bytes)
    public static var size: Int {return MemoryLayout<UInt8>.stride}

    /// Get bit 0 value
    public var b0: UInt8 {
        return (self & (0x1 << 0)) >> 0
    }

    /// Sets the bit 0 of the UInt8 to given bit
    public mutating func setb0(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = (self & ~(0x1 << 0)) | (nv.toU8 << 0)
    }

    /// Sets the bit 0 of the UInt8 to given bit
    public mutating func setb0(_ bit: UInt8) {
        let nv = bit != 0 ? 1 : 0
        self = (self & ~(0x1 << 0)) | (nv.toU8 << 0)
    }

    /// Get bit 1 value
    public var b1: UInt8 {
        return (self & (0x1 << 1)) >> 1
    }

    /// Sets the bit 1 of the UInt8 to given bit
    public mutating func setb1(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = (self & ~(0x1 << 1)) | (nv.toU8 << 1)
    }

    /// Sets the bit 1 of the UInt8 to given bit
    public mutating func setb1(_ bit: UInt8) {
        let nv = bit != 0 ? 1 : 0
        self = (self & ~(0x1 << 1)) | (nv.toU8 << 1)
    }

    /// Get bit 2 value
    public var b2: UInt8 {
        return (self & (0x1 << 2)) >> 2
    }

    /// Sets the bit 2 of the UInt8 to given bit
    public mutating func setb2(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = (self & ~(0x1 << 2)) | (nv.toU8 << 2)
    }

    /// Sets the bit 2 of the UInt8 to given bit
    public mutating func setb2(_ bit: UInt8) {
        let nv = bit != 0 ? 1 : 0
        self = (self & ~(0x1 << 2)) | (nv.toU8 << 2)
    }

    /// Get bit 3 value
    public var b3: UInt8 {
        return (self & (0x1 << 3)) >> 3
    }

    /// Sets the bit 3 of the UInt8 to given bit
    public mutating func setb3(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = (self & ~(0x1 << 3)) | (nv.toU8 << 3)
    }

    /// Sets the bit 3 of the UInt8 to given bit
    public mutating func setb3(_ bit: UInt8) {
        let nv = bit != 0 ? 1 : 0
        self = (self & ~(0x1 << 3)) | (nv.toU8 << 3)
    }

    /// Get the bit number 4 fo the value
    public var b4: UInt8 {
        return (self & (0x1 << 4)) >> 4
    }

    /// Sets the bit 4 of the UInt8 to given bit
    public mutating func setb4(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = (self & ~(0x1 << 4)) | (nv.toU8 << 4)
    }

    /// Sets the bit 4 of the UInt8 to given bit
    public mutating func setb4(_ bit: UInt8) {
        let nv = bit != 0 ? 1 : 0
        self = (self & ~(0x1 << 4)) | (nv.toU8 << 4)
    }

    /// Get bit 5 value
    public var b5: UInt8 {
        return (self & (0x1 << 5)) >> 5
    }

    /// Sets the bit 5 of the UInt8 to given bit
    public mutating func setb5(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = (self & ~(0x1 << 5)) | (nv.toU8 << 5)
    }

    /// Sets the bit 5 of the UInt8 to given bit
    public mutating func setb5(_ bit: UInt8) {
        let nv = bit != 0 ? 1 : 0
        self = (self & ~(0x1 << 5)) | (nv.toU8 << 5)
    }

    /// Get bit 6 value
    public var b6: UInt8 {
        return (self & (0x1 << 6)) >> 6
    }

    /// Sets the bit 6 of the UInt8 to given bit
    public mutating func setb6(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = (self & ~(0x1 << 6)) | (nv.toU8 << 6)
    }

    /// Sets the bit 6 of the UInt8 to given bit
    public mutating func setb6(_ bit: UInt8) {
        let nv = bit != 0 ? 1 : 0
        self = (self & ~(0x1 << 6)) | (nv.toU8 << 6)
    }

    /// Get bit 7 value
    public var b7: UInt8 {
        return (self & (0x1 << 7)) >> 7
    }

    /// Sets the bit 7 of the UInt8 to given bit
    public mutating func setb7(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = (self & ~(0x1 << 7)) | (nv.toU8 << 7)
    }

    /// Sets the bit 7 of the UInt8 to given bit
    public mutating func setb7(_ bit: UInt8) {
        let nv = bit != 0 ? 1 : 0
        self = (self & ~(0x1 << 7)) | (nv.toU8 << 7)
    }

    /// Subscript that returns or set one of the bytes of this integer
    /// at the given index.
    /// Trying to access an out of index byte will result in an error.
    public subscript(index: Int) -> UInt8 {
        get {
            precondition(index<UInt8.size, "Byte set index out of range")
            return self
        }
        set(newValue) {
            precondition(index<UInt8.size, "Byte set index out of range")
            self = newValue
        }
    }
}
