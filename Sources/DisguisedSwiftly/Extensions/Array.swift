//
//  Array.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 28/10/2021.
//

import Foundation

extension Array where Element: Equatable {
    
    @discardableResult
    public mutating func replace(_ element: Element, with new: Element) -> Bool {
        if let first = self.firstIndex(where: { $0 == element}) {
            self[first] = new
            return true
        }
        return false
    }
}
