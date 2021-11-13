//
//  Int64.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 28/10/2021.
//

import Foundation

/**
Extension that adds a few additional functionalities to Int64:
- toIntN/toUIntN truncating bit pattern conversions
- allOnes
- size
- Byte indexed subscript
*/
extension Int64 {

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
    public var toU64: UInt64 {return UInt64(bitPattern: self)}
    /// Perform a bit pattern truncating conversion to Int64
    public var to64: Int64 {return self}
    /// Perform a bit pattern truncating conversion to Int
    public var toInt: Int {return Int(truncatingIfNeeded: self)}
    /// Perform a bit pattern truncating conversion to UInt
    public var toUInt: UInt {return UInt(truncatingIfNeeded: self)}

    /// Create bits mask with one
    public func mask(_ bits: Int64, _ msb: Bool) -> Int64 {
        if (bits >> 3) == Int64.size { return Int64.max }

        let mask = Int64(truncating: NSDecimalNumber(decimal: (pow(2, bits.toInt) - 1)))

        switch msb {
        case false:
            return mask
        case true:
            let shift = Int64(Int64.size << 3) - bits
            return mask << shift
        }
    }

    /// Returns the size of this type (number of bytes)
    public static var size: Int {return MemoryLayout<Int64>.stride}

    /// Get bit 0 from value
    public var b0: Int64 {
        return ((self.toU64 & (0x1 << 0)) >> 0).to64
    }

    /// Sets the bit 0 of the Int64 to given bit
    public mutating func setb0(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU64 & ~(0x1 << 0)) | (nv.toU64 << 0)).to64
    }

    /// Get bit 1 from value
    public var b1: Int64 {
        return ((self.toU64 & (0x1 << 1)) >> 1).to64
    }

    /// Sets the bit 1 of the Int64 to given bit
    public mutating func setb1(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU64 & ~(0x1 << 1)) | (nv.toU64 << 1)).to64
    }

    /// Get bit 2 from value
    public var b2: Int64 {
        return ((self.toU64 & (0x1 << 2)) >> 2).to64
    }

    /// Sets the bit 2 of the Int64 to given bit
    public mutating func setb2(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU64 & ~(0x1 << 2)) | (nv.toU64 << 2)).to64
    }

    /// Get bit 3 from value
    public var b3: Int64 {
        return ( (self.toU64 & (0x1 << 3)) >> 3 ).to64
    }

    /// Sets the bit 3 of the Int64 to given bit
    public mutating func setb3(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU64 & ~(0x1 << 3)) | (nv.toU64 << 3)).to64
    }

    /// Get bit 4 from value
    public var b4: Int64 {
        return ( (self.toU64 & (0x1 << 4)) >> 4 ).to64
    }

    /// Sets the bit 4 of the Int64 to given bit
    public mutating func setb4(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU64 & ~(0x1 << 4)) | (nv.toU64 << 4)).to64
    }

    /// Get bit 5 from value
    public var b5: Int64 {
        return ( (self.toU64 & (0x1 << 5)) >> 5 ).to64
    }

    /// Sets the bit 5 of the Int64 to given bit
    public mutating func setb5(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU64 & ~(0x1 << 5)) | (nv.toU64 << 5)).to64
    }

    /// Get bit 6 from value
    public var b6: Int64 {
        return ( (self.toU64 & (0x1 << 6)) >> 6 ).to64
    }

    /// Sets the bit 6 of the Int64 to given bit
    public func setb6(_ bit: Int) -> Int64 {
        let nv = bit != 0 ? 1 : 0
        return ( (self.toU64 & ~(0x1 << 6)) | (nv.toU64 << 6) ).to64
    }

    /// Get bit 7 from value
    public var b7: Int64 {
        return ( (self.toU64 & (0x1 << 7)) >> 7 ).to64
    }

    /// Sets the bit 7 of the Int64 to given bit
    public mutating func setb7(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU64 & ~(0x1 << 7)) | (nv.toU64 << 7)).to64
    }

    /// Subscript that returns or set one of the bytes of a Int64
    /// at the given index.
    /// Trying to access an out of index byte will result in an precondition.
    public subscript(index: Int) -> Int64 {
        get {
            precondition(index<Int64.size, "Byte set index out of range")
            return ((self.toU64 & (0xFF << (index.toU64*8))) >> (index.toU64*8)).to64
        }
        set(newValue) {
            precondition(index<Int64.size, "Byte set index out of range")
            self = ( (self.toU64 & ~(0xFF << (index.toU64*8))) | (newValue.toU64 << (index.toU64*8)) ).to64
        }
    }
}
