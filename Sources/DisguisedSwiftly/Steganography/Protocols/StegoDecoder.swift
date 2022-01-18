//
//  File.swift
//  
//
//  Created by Lukasz Stachnik on 03/11/2021.
//

import Foundation
import UIKit

public typealias StegoDecodingResult = Result<String, Error>
public typealias StegoDecodingCompletion = (StegoDecodingResult) -> Void

protocol StegoDecoder {
    func decodeTextInImage(in image: UIImage, completion: @escaping StegoDecodingCompletion)
}
