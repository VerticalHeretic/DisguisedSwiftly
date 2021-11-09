//
//  Array.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 28/10/2021.
//

import Foundation

extension Array where Element: Equatable {

    /// Replaces given element in array with new one
    /// - Parameters:
    ///   - element: Element in array to replace
    ///   - new: New Element to which old will be replaced
    ///
    ///     **Example Usage**:
    ///
    ///     ```
    ///            let array = ["Apple", "Orange", "Banana"]
    ///            let replaced = array.replace("Apple", "Swift") // will change array to ["Swift", "Orange", "Banana"]
    ///            print(replaced) // will print True
    ///     ```
    ///
    /// - Returns: True if replaced and False if not
    @discardableResult
    public mutating func replace(_ element: Element, with new: Element) -> Bool {
        if let first = self.firstIndex(where: { $0 == element}) {
            self[first] = new
            return true
        }
        return false
    }
}
