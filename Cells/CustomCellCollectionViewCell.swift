//
//  CustomCellCollectionViewCell.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 27/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class CustomCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var topView: UIView!
    
    
    override func awakeFromNib() {
           super.awakeFromNib()
          
           topView.layer.masksToBounds = false
                                topView.layer.shadowColor = UIColor.lightGray.cgColor
                                topView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
                                topView.layer.shadowOpacity = 0.5
       }
    
}
