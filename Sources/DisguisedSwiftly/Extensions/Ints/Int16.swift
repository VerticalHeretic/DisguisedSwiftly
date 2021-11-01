//
//  Int16.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 28/10/2021.
//

import Foundation

/**
Extension that adds a few additional functionalities to Int16:
- toIntN/toUIntN truncating bit pattern conversions
- allOnes
- size
- Byte indexed subscript
*/
extension Int16 {
    
    /// Perform a bit pattern truncating conversion to UInt8
    public var toU8: UInt8 {return UInt8(truncatingIfNeeded: self)}
    /// Perform a bit pattern truncating conversion to Int8
    public var to8: Int8 {return Int8(truncatingIfNeeded: self)}
    /// Perform a bit pattern truncating conversion to UInt16
    public var toU16: UInt16 {return UInt16(bitPattern: self)}
    /// Perform a bit pattern truncating conversion to Int16
    public var to16: Int16 {return self}
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
    public func mask(_ bits: Int16, _ msb: Bool) -> Int16 {
        if (bits >> 3) == Int16.size { return Int16.max }

        let mask = Int16(truncating: NSDecimalNumber(decimal: (pow(2, bits.toInt) - 1)))

        switch msb {
        case false:
            return mask
        case true:
            let shift = Int16(Int16.size << 3) - bits
            return mask << shift
        }
    }

    /// Returns the size of this type (number of bytes)
    public static var size: Int {return MemoryLayout<Int16>.stride}

    /// Get bit 0 value
    public var b0: Int16 {
        return ((self.toU16 & (0x1 << 0)) >> 0).to16
    }
    
    /// Sets the bit 0 of the Int16 to given bit
    public mutating func setb0(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU16 & ~(0x1 << 0)) | (nv.toU16 << 0)).to16
    }
    
    /// Get bit 1 value
    public var b1: Int16 {
        return ((self.toU16 & (0x1 << 1)) >> 1).to16
    }
    
    /// Sets the bit 1 of the Int16 to given bit
    public mutating func setb1(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU16 & ~(0x1 << 1)) | (nv.toU16 << 1)).to16
    }
    
    /// Get bit 2 value
    public var b2: Int16 {
        return ((self.toU16 & (0x1 << 2)) >> 2).to16
    }
    
    /// Sets the bit 2 of the Int16 to given bit
    public mutating func setb2(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU16 & ~(0x1 << 2)) | (nv.toU16 << 2)).to16
    }
    
    /// Get bit 3 value
    public var b3: Int16 {
        return ((self.toU16 & (0x1 << 3)) >> 3).to16
    }
    
    /// Sets the bit 3of the Int16 to given bit
    public mutating func setb3(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU16 & ~(0x1 << 3)) | (nv.toU16 << 3)).to16
    }
    
    /// Get bit 4 value
    public var b4: Int16 {
        return ((self.toU16 & (0x1 << 4)) >> 4).to16
    }
    
    /// Sets the bit 4 of the Int16 to given bit
    public mutating func setb4(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU16 & ~(0x1 << 4)) | (nv.toU16 << 4)).to16
    }
    
    /// Get bit 5 value
    public var b5: Int16 {
        return ((self.toU16 & (0x1 << 5)) >> 5).to16
    }
    
    /// Sets the bit 5 of the Int16 to given bit
    public mutating func setb5(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU16 & ~(0x1 << 5)) | (nv.toU16 << 5)).to16
    }
    
    /// Get bit 6 value
    public var b6: Int16 {
        return ( (self.toU16 & (0x1 << 6)) >> 6 ).to16
    }
    
    /// Sets the bit 6 of the Int16 to given bit
    public mutating func setb6(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU16 & ~(0x1 << 6)) | (nv.toU16 << 6)).to16
    }
    
    /// Get bit 7 value
    public var b7: Int16 {
        return ( (self.toU16 & (0x1 << 7)) >> 7 ).to16
    }
    
    /// Sets the bit 7 of the Int16 to given bit
    public mutating func setb7(_ bit: Int) {
        let nv = bit != 0 ? 1 : 0
        self = ((self.toU16 & ~(0x1 << 7)) | (nv.toU16 << 7)).to16
    }

    /// Subscript that returns or set one of the bytes of a Int16
    /// at the given index.
    /// Trying to access an out of index byte will result in an precondition.
    public subscript(index: Int) -> Int16 {
        get {
            precondition(index<Int16.size, "Byte set index out of range")
            return ((self.toU16 & (0xFF << (index.toU16*8))) >> (index.toU16*8)).to16
        }
        set(newValue) {
            precondition(index<Int16.size, "Byte set index out of range")
            self = ( (self.toU16 & ~(0xFF << (index.toU16*8))) | (newValue.toU16 << (index.toU16*8)) ).to16
        }
    }
}
