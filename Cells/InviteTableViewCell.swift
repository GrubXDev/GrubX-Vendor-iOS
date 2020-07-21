//
//  InviteTableViewCell.swift
//  Grub X Vender
//
//  Created by MAD-MAC on 23/04/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class InviteTableViewCell: UITableViewCell {

    @IBOutlet weak var mbleLbl: UILabel!
    
    @IBOutlet weak var zipcodeLBL: UILabel!
    @IBOutlet weak var businessNAmeLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
