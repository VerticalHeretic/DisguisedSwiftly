//
//  UIView.swift
//  Steganographer
//
//  Created by Łukasz Stachnik on 26/10/2021.
//

import UIKit

extension UIView {

    /// Sets accessibility identifier for the View and marks it as an accessibility element
    /// - Parameter identifier: accessibility identifier string
    func setAccessibiltyWithIdentifier(_ identifier: String) {
        self.isAccessibilityElement = true
        self.accessibilityIdentifier = identifier
    }

}
