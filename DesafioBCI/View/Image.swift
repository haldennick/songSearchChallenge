//
//  Image.swift
//  DesafioBCI
//
//  Created by Carlos Sepulveda on 24-02-20.
//  Copyright © 2020 Carlos Sepulveda. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedImageView: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
}
