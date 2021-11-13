//
//  UInt.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 28/10/2021.
//

import Foundation

/**
Extension that adds a few additional functionalities to UInt:
- toIntN/toUIntN truncating bit pattern conversions
- allOnes
- size
- Byte indexed subscript
*/
extension UInt {

    /// Perform a bit pattern truncating conversion to UInt8
    public var toU8: UInt8 {return UInt8(truncatingIfNeeded: self)}
    /// Perform a bit pattern truncating conversion to Int8
    public var to8: Int8 {return Int8(truncatingIfNeeded: self)}
    /// Perform a bit pattern truncating conversion to UInt16
    public var toU16: UInt16 {return UInt16(truncatingIfNeeded: self)}
    /// Perform a bit pattern truncating conversion to Int16
    public var to16: Int16 {return Int16(truncatingIfNeeded: self)}
    /// Perform a bit pattern truncating conversion to UInt32
    public var toU32: UInt32 {return UInt32(truncatingIfNeeded: self)}
    /// Perform a bit pattern truncating conversion to Int32
    public var to32: Int32 {return Int32(truncatingIfNeeded: self)}
    /// Perform a bit pattern truncating conversion to UInt64
    public var toU64: UInt64 {
        return UInt64(self) // No difference if the platform is 32 or 64
        }
    /// Perform a bit pattern truncating conversion to Int64
    public var to64: Int64 {
        return Int64(self) // No difference if the platform is 32 or 64
        }
    /// Perform a bit pattern truncating conversion to Int
    public var toInt: Int {return Int(bitPattern: self)}
    /// Perform a bit pattern truncating conversion to UInt
    public var toUInt: UInt {return self}

    /// Create bits mask with one
    public func mask(_ bits: UInt, _ msb: Bool) -> UInt {
        if (bits >> 3) == UInt.size { return UInt.max }

        let mask = UInt(truncating: NSDecimalNumber(decimal: (pow(2, bits.toInt) - 1)))

        switch msb {
        case false:
            return mask
        case true:
            let shift = UInt(UInt.size << 3) - bits
            return mask << shift
        }
    }

    /// Returns the size of this type (number of bytes)
    public static var size: Int {return MemoryLayout<UInt>.stride}

    /// Get bit 0 from value
    public var b0: UInt {
        return ( self & (0x1 << 0)) >> 0
    }

    /// Sets the bit 0 of the UInt to given bit
    public mutating func setb0(_ bit: Int) {
        let nv: UInt = bit != 0 ? 1 : 0
        self = ( self & ~(0x1 << 0)) | (nv << 0)
    }

    /// Get bit 1 from value
    public var b1: UInt {
        return ( self & (0x1 << 1)) >> 1
    }

    /// Sets the bit 1 of the UInt to given bit
    public mutating func setb1(_ bit: Int) {
        let nv: UInt = bit != 0 ? 1 : 0
        self = (self & ~(0x1 << 1)) | (nv << 1)
    }

    /// Get bit 2 from value
    public var b2: UInt {
        return (self & (0x1 << 2)) >> 2
    }

    /// Sets the bit 2 of the UInt to given bit
    public mutating func setb2(_ bit: Int) {
        let nv: UInt = bit != 0 ? 1 : 0
        self = (self & ~(0x1 << 2)) | (nv << 2)
    }

    /// Get bit 3 from value
    public var b3: UInt {
        return (self & (0x1 << 3)) >> 3
    }

    /// Sets the bit 3 of the UInt to given bit
    public mutating func setb3(_ bit: Int) {
        let nv: UInt = bit != 0 ? 1 : 0
        self = (self & ~(0x1 << 3)) | (nv << 3)
    }

    /// Get bit 4 from value
    public var b4: UInt {
        return ( self & (0x1 << 4)) >> 4
    }

    /// Set bit 4 and return a new UInt
    public mutating func setb4(_ bit: Int) {
        let nv: UInt = bit != 0 ? 1 : 0
        self = (self & ~(0x1 << 4)) | (nv << 4)
    }

    /// Get bit 5 from value
    public var b5: UInt {
        return ( self & (0x1 << 5)) >> 5
    }

    /// Set bit 5 and return a new UInt
    public mutating func setb5(_ bit: Int) {
        let nv: UInt = bit != 0 ? 1 : 0
        self = (self & ~(0x1 << 5)) | (nv << 5)
    }

    /// Get bit 6 from value
    public var b6: UInt {
        return (self & (0x1 << 6)) >> 6
    }

    /// Set bit 6 and return a new UInt
    public mutating func setb6(_ bit: Int) {
        let nv: UInt = bit != 0 ? 1 : 0
        self = (self & ~(0x1 << 6)) | (nv << 6)
    }

    /// Get bit 7 from value
    public var b7: UInt {
        return (self & (0x1 << 7)) >> 7
    }

    /// Set bit 7 and return a new UInt
    public mutating func setb7(_ bit: Int) {
        let nv: UInt = bit != 0 ? 1 : 0
        self = ( self & ~(0x1 << 7)) | (nv << 7)
    }

    /// Subscript that returns or set one of the bytes of a UInt
    /// at the given index.
    /// Trying to access an out of index byte will result in an error.
    public subscript(index: Int) -> UInt {
        get {
            precondition(index<Int.size, "Byte set index out of range")
            let idx: UInt = UInt(bitPattern: index) * 8
            return (self & (0xFF << idx)) >> idx
        }
        set(newValue) {
            precondition(index<Int.size, "Byte set index out of range")
            let idx: UInt = UInt(bitPattern: index) * 8
            self = (self & ~(0xFF << idx)) | (newValue << idx)
        }
    }
}
