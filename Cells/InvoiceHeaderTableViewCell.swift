//
//  InvoiceHeaderTableViewCell.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 22/04/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class InvoiceHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var oredrNumLbl: UILabel!
    
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var buyerNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
