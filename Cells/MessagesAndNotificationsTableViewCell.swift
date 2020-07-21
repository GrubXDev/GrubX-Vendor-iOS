//
//  MessagesAndNotificationsTableViewCell.swift
//  Grub X Vender
//
//  Created by Shreyash Shriyam on 02/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class MessagesAndNotificationsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var name1: UILabel!
    
    @IBOutlet weak var name2: UILabel!
    
    @IBOutlet weak var time: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
