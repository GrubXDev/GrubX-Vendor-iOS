//
//  GrubXBuyersTableViewCell.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 13/03/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
protocol GrubXBuyersTableViewCellDelegate :AnyObject{
    
    
    
    func updateClick2(cell: GrubXBuyersTableViewCell)
    
}
class GrubXBuyersTableViewCell: UITableViewCell {
    var delegate : GrubXBuyersTableViewCellDelegate?
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var businessMobileNo: UILabel!
    @IBOutlet weak var businessAddress: UILabel!
    @IBOutlet weak var businessName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var topView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        topView.layer.masksToBounds = false
                                          
               topView.layer.shadowColor = UIColor.lightGray.cgColor
                                          
               topView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
                                          
               topView.layer.shadowOpacity = 0.5
        topView.layer.cornerRadius=5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    @IBAction func checkBtnTap(_ sender: Any) {
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
                    
                    self.delegate?.updateClick2(cell: self)
        
        
        
        
        
    }
    
}
