//
//  Operators.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 28/10/2021.
//

import Foundation

// MARK: Operators
/// Double negation operator
prefix operator ~~

/// Double negation operator for Int8
/// Returns 1 if value is not equal to 0, 0 otherwise
prefix func ~~ (value: Int8) -> Int8 {
    return (value>0) ? 1 : 0
}

/// Double negation operator for UInt8
/// Returns 1 if value is not equal to 0, 0 otherwise
prefix func ~~ (value: UInt8) -> UInt8 {
    return (value>0) ? 1 : 0
}

/// Double negation operator for Int16
/// Returns 1 if value is not equal to 0, 0 otherwise
prefix func ~~ (value: Int16) -> Int16 {
    return (value>0) ? 1 : 0
}

/// Double negation operator for UInt16
/// Returns 1 if value is not equal to 0, 0 otherwise
prefix func ~~ (value: UInt16) -> UInt16 {
    return (value>0) ? 1 : 0
}

/// Double negation operator for Int32
/// Returns 1 if value is not equal to 0, 0 otherwise
prefix func ~~ (value: Int32) -> Int32 {
    return (value>0) ? 1 : 0
}

/// Double negation operator for UInt32
/// Returns 1 if value is not equal to 0, 0 otherwise
prefix func ~~ (value: UInt32) -> UInt32 {
    return (value>0) ? 1 : 0
}

/// Double negation operator for Int64
/// Returns 1 if value is not equal to 0, 0 otherwise
prefix func ~~ (value: Int64) -> Int64 {
    return (value>0) ? 1 : 0
}

/// Double negation operator for UInt64
/// Returns 1 if value is not equal to 0, 0 otherwise
prefix func ~~ (value: UInt64) -> UInt64 {
    return (value>0) ? 1 : 0
}
