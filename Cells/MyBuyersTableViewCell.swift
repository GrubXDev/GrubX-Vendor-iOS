//
//  MyBuyersTableViewCell.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 13/03/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
protocol MyBuyersTableViewCellDelegate :AnyObject{
    
    
    
    func updateClick(cell: MyBuyersTableViewCell)
    
}
class MyBuyersTableViewCell: UITableViewCell {
var delegate : MyBuyersTableViewCellDelegate?
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var businessContact: UILabel!
    @IBOutlet weak var businessPincode: UILabel!
    @IBOutlet weak var businessName: UILabel!
    
    @IBOutlet weak var checkBtnWidth: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onCheckBoxTap(_ sender: Any) {
        
        if Constants.check == false {
                 
                // checkBtn.setImage("Grub-X_0031_Layer-5-copy-2", for: .normal)
                   checkBtn.setImage( UIImage(named:"Grub-X_0032_check-mark-copy-2"), for: .normal)
                 Constants.check = true
                 
             }else{
                // Grub-X_0032_check-mark-copy-2
                // Grub-X_0031_Layer-5-copy-2
                 
                  checkBtn.setImage( UIImage(named:"Grub-X_0031_Layer-5-copy-2"), for: .normal)
                 Constants.check = false
                // addBtn.isHidden = false
                // countTF.isHidden=true
                 //checkBtn.isHidden=true
             }
             
             self.delegate?.updateClick(cell: self)
        
    }
    
}
