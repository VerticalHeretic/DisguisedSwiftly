//
//  File.swift
//  
//
//  Created by Lukasz Stachnik on 03/11/2021.
//

import Foundation
import UIKit

protocol StegoDecoder {
    func decodeTextInImage(image: UIImage, finished: (Bool) -> Void) -> String
}
