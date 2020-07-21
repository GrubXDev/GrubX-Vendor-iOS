//
//  SecondTableViewCell.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 20/03/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    @IBOutlet weak var businessMobileLBL: UILabel!
    @IBOutlet weak var businessAddressLbl: UILabel!
    @IBOutlet weak var businessLocationLBL: UILabel!
    @IBOutlet weak var businessNameLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var checkBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onCheckBtnTap(_ sender: Any) {
        
        
        
        
    }
}
