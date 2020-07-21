//
//  MyFavoriteCollectionViewCell.swift
//  Grub X Vender
//
//  Created by Shreyash Shriyam on 02/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class MyFavoriteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var cellView: UIView!
    
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var nameLbl2: UILabel!
    
 
  
    
    @IBOutlet weak var contactBtn: UIButton!
    override func awakeFromNib() {
                 super.awakeFromNib()
                
                 //cellView.layer.masksToBounds = false
                                                                cellView.layer.shadowColor = UIColor.lightGray.cgColor
                                                                 cellView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
                                                                 cellView.layer.shadowOpacity = 3.5
                                      cellView.layer.cornerRadius=10
                                          cellView.clipsToBounds=true
             }
}
