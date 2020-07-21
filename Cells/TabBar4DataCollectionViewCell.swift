//
//  TabBar4DataCollectionViewCell.swift
//  Grub X Vender
//
//  Created by MAD-MAC on 31/01/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class TabBar4DataCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var ActiveLabel: UILabel!
    
    
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var NameLbl2: UILabel!


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
