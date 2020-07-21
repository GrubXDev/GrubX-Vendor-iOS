//
//  FirstTableViewCell.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 20/03/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
protocol FirstTableViewCellDelegate :AnyObject{
    
    
    
    func updateClick(cell: FirstTableViewCell)
    
}
class FirstTableViewCell: UITableViewCell {
    var selectedCheckbox=false
    @IBOutlet weak var businessMobileLbl: UILabel!
    var delegate : FirstTableViewCellDelegate?
    @IBOutlet weak var businessPincodeLbl: UILabel!
    @IBOutlet weak var businessNameLbl: UILabel!
    @IBOutlet weak var checkBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func checkBtnTap(_ sender: Any) {
        if Constants.check == false {
                       
                      // checkBtn.setImage("Grub-X_0031_Layer-5-copy-2", for: .normal)
                         checkBtn.setImage( UIImage(named:"Grub-X_0032_check-mark-copy-2"), for: .normal)
                       Constants.check = true
            selectedCheckbox=true
                       
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
