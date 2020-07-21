//
//  HeaderTableCell.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 23/03/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class HeaderTableCell: UITableViewCell {
    @IBOutlet weak var buyernameLbl: UILabel!
    
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var deliverylocLbl: UILabel!
    @IBOutlet weak var orderno2Lbl: UILabel!
    @IBOutlet weak var zipcodeLbl: UILabel!
    @IBOutlet weak var ordernumLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
