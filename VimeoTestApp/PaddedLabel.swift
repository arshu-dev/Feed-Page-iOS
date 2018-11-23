//
//  PaddedLabel.swift
//  VimeoTestApp
//
//  Created by Arshad Parwez on 05/02/17.
//  Copyright © 2017 Arshd Parwez. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

class PaddedLabel: UILabel {
    
    var textInsets = UIEdgeInsets.zero {
        didSet { invalidateIntrinsicContentSize() }
    }
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insetRect = UIEdgeInsetsInsetRect(bounds, textInsets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -textInsets.top, left: -textInsets.left, bottom: -textInsets.bottom, right: -textInsets.right)
        return UIEdgeInsetsInsetRect(textRect, invertedInsets)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, textInsets))
    }
    
    @IBInspectable var topTextInset: CGFloat? {
        didSet {
            textInsets.top = topTextInset!
        }
    }
    
    @IBInspectable var leftTextInset: CGFloat? {
        didSet {
            textInsets.left = leftTextInset!
        }
    }
    
    @IBInspectable var bottomTextInset: CGFloat? {
        didSet {
            textInsets.bottom = bottomTextInset!
        }
    }
    
    @IBInspectable var rightTextInset: CGFloat? {
        didSet {
            textInsets.right = rightTextInset!
        }
    }
    
    var edgeInsets = UIEdgeInsets.zero {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override func layoutSubviews() {
        
        textInsets.top = 0
        textInsets.left = 5
        textInsets.bottom = 0
        textInsets.right = 5
    }
}
