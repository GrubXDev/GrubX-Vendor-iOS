//
//  SpecialCatalogueTableViewCell.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 26/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class SpecialCatalogueTableViewCell: UITableViewCell {

    @IBOutlet weak var catalogueName: UILabel!
    @IBOutlet weak var catalogueCount: UILabel!
    @IBOutlet weak var imageItems: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
