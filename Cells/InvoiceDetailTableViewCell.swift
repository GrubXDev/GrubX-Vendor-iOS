//
//  InvoiceDetailTableViewCell.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 22/04/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class InvoiceDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var productNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
