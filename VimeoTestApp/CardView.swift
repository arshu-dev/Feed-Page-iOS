//
//  CardView.swift
//  VimeoTestApp
//
//  Created by Arshad Parwez on 04/02/17.
//  Copyright © 2017 Arshd Parwez. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

class CardView: UIView {
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3

    @IBInspectable var cornerRadius: CGFloat? {
        didSet {
            layer.cornerRadius = cornerRadius!
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        didSet {
            layer.shadowColor = shadowColor?.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float? {
        didSet {
            layer.shadowOpacity = shadowOpacity!
        }
    }

    override func layoutSubviews() {
        
        layer.cornerRadius = 4
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius)
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowPath = shadowPath.cgPath
    }
}
