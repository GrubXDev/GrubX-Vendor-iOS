//
//  FAQsTableViewCell.swift
//  Grub X Vender
//
//  Created by MAD-MAC on 18/03/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class FAQsTableViewCell: UITableViewCell {

    @IBOutlet weak var questionLbl: UILabel!
    
    @IBOutlet weak var answerLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
