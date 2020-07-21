//
//  CatalogueTableViewCell.swift
//  Grub X Vender
//
//  Created by MAD-MAC on 29/01/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class CatalogueTableViewCell: UITableViewCell {

    @IBOutlet weak var imageIcons: UIImageView!
    
    
    @IBOutlet weak var namesLbl: UILabel!
    
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
