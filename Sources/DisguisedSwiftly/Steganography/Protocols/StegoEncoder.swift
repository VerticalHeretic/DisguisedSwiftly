//
//  File.swift
//  
//
//  Created by Lukasz Stachnik on 03/11/2021.
//

import Foundation
import UIKit

protocol StegoEncoder {
    func encodeTextInImage(with text: String, image: UIImage, finished: (Bool) -> ()) -> UIImage?
}
