//
//  Int32.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 28/10/2021.
//

import Foundation

/**
Extension that adds a few additional functionalities to Int32:
- toIntN/toUIntN truncating bit pattern conversions
- allOnes
- size
- Byte indexed subscript
*/
extension Int32 {

    /// Perform a bit pattern truncating conversion to UInt8
    public var toU8: UInt8 {return UInt8(truncatingIfNeeded: self)}
    /// Perform a bit pattern truncating conversion to Int8
    public var to8: Int8 {return Int8(truncatingIfNeeded: self)}
    /// Perform a bit pattern truncating conversion to UInt16
    public var toU16: UInt16 {return UInt16(truncatingIfNeeded: self)}
    /// Perform a bit pattern truncating conversion to Int16
    public var to16: Int16 {return Int16(truncatingIfNeeded: self)}
    /// Perform a bit pattern truncating conversion to UInt32
    public var toU32: UInt32 {return UInt32(bitPattern: self)}
    /// Perform a bit pattern truncating conversion to Int32
    public var to32: Int32 {return self}
    /// Perform a bit pattern truncating conversion to UInt64
    public var toU64: UInt64 {return UInt64(self)}
    /// Perform a bit pattern truncating conversion to Int64
    public var to64: Int64 {return Int64(self)}
    /// Perform a bit pattern truncating conversion to Int
    public var toInt: Int {return Int(bitPattern: UInt(self))}
    /// Perform a bit pattern truncating conversion to UInt
    public var toUInt: UInt {return UInt(self)}

    /// Create bits mask with one
    public func mask(_ bits: Int32, _ msb: Bool) -> Int32 {
        if (bits >> 3) == Int32.size { return Int32.max }

        let mask = Int32(truncating: NSDecimalNumber(decimal: (pow(2, bits.toInt) - 1)))

        switch msb {
        case false:
            return mask
        case true:
            let shift = Int32(Int32.size << 3) - bits
            return mask << shift
        }
    }

    /// Returns the size of this type (number of bytes)
    public static var size: Int {return MemoryLayout<Int32>.stride}

    /// Get bit 0 from value
    public var b0: Int32 {
        return ((self.toU32 & (0x1 << 0)) >> 0).to32
    }

    /// Sets the bit 0 of the Int32 to given bit
    public mutating func setb0(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU32 & ~(0x1 << 0)) | (nv.toU32 << 0)).to32
    }

    /// Get bit 1 from value
    public var b1: Int32 {
        return ((self.toU32 & (0x1 << 1)) >> 1).to32
    }

    /// Sets the bit 1 of the Int32 to given bit
    public mutating func setb1(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU32 & ~(0x1 << 1)) | (nv.toU32 << 1)).to32
    }

    /// Get bit 2 from value
    public var b2: Int32 {
        return ((self.toU32 & (0x1 << 2)) >> 2).to32
    }

    /// Sets the bit 2 of the Int32 to given bit
    public mutating func setb2(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU32 & ~(0x1 << 2)) | (nv.toU32 << 2)).to32
    }

    /// Get bit 3 from value
    public var b3: Int32 {
        return ((self.toU32 & (0x1 << 3)) >> 3).to32
    }

    /// Sets the bit 3 of the Int32 to given bit
    public mutating func setb3(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU32 & ~(0x1 << 3)) | (nv.toU32 << 3)).to32
    }

    /// Get bit 4 from value
    public var b4: Int32 {
        return ((self.toU32 & (0x1 << 4)) >> 4).to32
    }

    /// Sets the bit 4 of the Int32 to given bit
    public mutating func setb4(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU32 & ~(0x1 << 4)) | (nv.toU32 << 4)).to32
    }

    /// Get bit 5 from value
    public var b5: Int32 {
        return ((self.toU32 & (0x1 << 5)) >> 5).to32
    }

    /// Sets the bit 5 of the Int32 to given bit
    public mutating func setb5(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU32 & ~(0x1 << 5)) | (nv.toU32 << 5)).to32
    }

    /// Get bit 6 from value
    public var b6: Int32 {
        return ((self.toU32 & (0x1 << 6)) >> 6).to32
    }

    /// Sets the bit 6 of the Int32 to given bit
    public mutating func setb6(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU32 & ~(0x1 << 6)) | (nv.toU32 << 6)).to32
    }

    /// Get bit 7 from value
    public var b7: Int32 {
        return ( (self.toU32 & (0x1 << 7)) >> 7 ).to32
    }

    /// Sets the bit 7 of the Int32 to given bit
    public mutating func setb7(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU32 & ~(0x1 << 7)) | (nv.toU32 << 7)).to32
    }

    /// Subscript that returns or set one of the bytes of a Int32
    /// at the given index.
    /// Trying to access an out of index byte will result in an precondition.
    public subscript(index: Int) -> Int32 {
        get {
            precondition(index<Int32.size, "Byte set index out of range")
            return ((self.toU32 & (0xFF << (index.toU32*8))) >> (index.toU32*8)).to32
        }
        set(newValue) {
            precondition(index<Int32.size, "Byte set index out of range")
            self = ( (self.toU32 & ~(0xFF << (index.toU32*8))) | (newValue.toU32 << (index.toU32*8)) ).to32
        }
    }
}
