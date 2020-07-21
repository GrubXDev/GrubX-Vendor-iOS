//
//  AddBusinessTableViewCell.swift
//  Grub X
//
//  Created by MAD-MAC on 10/01/20.
//  Copyright © 2020 My Apps Development. All rights reserved.
//

import UIKit

class AddBusinessTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var contentTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
