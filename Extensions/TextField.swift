//
//  TextField.swift
//  Mahendra logistics
//
//  Created by VamsiKrishna on 16/07/18.
//  Copyright © 2018 HJSoftware. All rights reserved.
//

import UIKit

@IBDesignable
class TextField: UITextField {
    
    @IBInspectable var rightImage : UIImage?
    @IBInspectable var leftImage : UIImage?
    @IBInspectable var placeHolderColor : UIColor = .lightGray
    @IBInspectable var isLeftViewEnable : Bool = false
    @IBInspectable var isRightViewEnable : Bool = false

    override func draw(_ rect: CGRect) {

        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.height, height: self.frame.size.height))
        view.backgroundColor = .clear
        view.layer.cornerRadius = 4
        
        let imageView = UIImageView(frame: CGRect(x: view.frame.origin.x+6, y: view.frame.origin.x+6, width: view.frame.size.width-12, height: view.frame.size.height-12))
        
        
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedString.Key.foregroundColor : placeHolderColor])
        
        if isLeftViewEnable {
            self.leftViewMode = .always
            //self.rightViewMode = .always
            self.leftView = view
            imageView.image = leftImage
            imageView.contentMode = .scaleAspectFit
            view.addSubview(imageView)
        } else {
            self.leftViewMode = .never
            self.leftView = nil
        }
        
        if isRightViewEnable {
            self.rightViewMode = .always
            self.leftViewMode = .always
            self.rightView = view
            imageView.image = rightImage
            imageView.contentMode = .scaleAspectFit
            view.addSubview(imageView)
        } else {
            self.rightViewMode = .never
            self.rightView = nil
        }
        
    }
    
}
