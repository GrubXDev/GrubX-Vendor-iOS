//
//  ProceedTableViewCell.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 12/03/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class ProceedTableViewCell: UITableViewCell {

   
    @IBOutlet weak var quantityTF: UITextField!
    @IBOutlet weak var unitsLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
