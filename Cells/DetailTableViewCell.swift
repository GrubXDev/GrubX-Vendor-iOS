//
//  DetailTableViewCell.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 23/03/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var locLbl: UILabel!
    @IBOutlet weak var orderdateLbl: UILabel!
    @IBOutlet weak var ordernumLbl: UILabel!
    @IBOutlet weak var quantityLbl: UILabel!
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
