//
//  HomePageTableViewCell.swift
//  Grub X Vender
//
//  Created by vamsikrishna on 28/01/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class HomePageTableViewCell: UITableViewCell {

    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var DeliveryLocationStackView: UIStackView!
    @IBOutlet weak var itemNameLbl: UILabel!
    @IBOutlet weak var itemNameValueLbl: UILabel!
    @IBOutlet weak var rejectStackView: UIStackView!
    @IBOutlet weak var messageStackView: UIStackView!
    @IBOutlet weak var acceptStackView: UIStackView!
    @IBOutlet weak var trackStackView: UIStackView!
    
    @IBOutlet weak var view2: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        view1.layer.cornerRadius = 05
        view2.layer.cornerRadius = 05
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBAction func messageBtn(_ sender: Any) {
    }
    
    
    @IBAction func trackBtn(_ sender: Any) {
    }
}
