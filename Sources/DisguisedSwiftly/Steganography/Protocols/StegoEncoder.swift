//
//  File.swift
//  
//
//  Created by Lukasz Stachnik on 03/11/2021.
//

import Foundation
import UIKit

public typealias StegoEncodingResult = Result<UIImage?, Error>
public typealias StegoEncodingCompletion = (StegoEncodingResult) -> Void

protocol StegoEncoder {
    func encodeTextInImage(with text: String, in image: UIImage, completion: @escaping StegoEncodingCompletion)
}
