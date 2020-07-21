//
//  InvoiceFooterTableViewCell.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 22/04/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class InvoiceFooterTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var subTotalLbl: UILabel!
    
    @IBOutlet weak var totalAmountLbl: UILabel!
    @IBOutlet weak var deliveryChargesLbl: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
