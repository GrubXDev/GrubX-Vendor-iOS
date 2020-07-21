//
//  PlaceOrderCollectionViewCell.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 26/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
protocol PlaceOrderCollectionViewCellDelegate :AnyObject{
    
    
    func updateCart(cell: PlaceOrderCollectionViewCell)
    func updateTF(cell: PlaceOrderCollectionViewCell)
    func updateClick(cell: PlaceOrderCollectionViewCell)
    
}
class PlaceOrderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var countTF: UITextField!
    @IBOutlet weak var checkBtn: UIButton!
    var delegate : PlaceOrderCollectionViewCellDelegate?
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
           super.awakeFromNib()
           
           
                   topView.layer.masksToBounds = false
                      topView.layer.shadowColor = UIColor.lightGray.cgColor
                      topView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
                      topView.layer.shadowOpacity = 0.5
       }

    @IBAction func countTFTap(_ sender: UITextField) {
        self.delegate?.updateTF(cell: self)
    }
    
    
    
    @IBAction func checkBtnTap(_ sender: Any) {
        
        if Constants.check == false {
            
           // checkBtn.setImage("Grub-X_0031_Layer-5-copy-2", for: .normal)
              checkBtn.setImage( UIImage(named:"Grub-X_0032_check-mark-copy-2"), for: .normal)
            addBtn.isHidden=true
            countTF.isHidden=false
            countTF.becomeFirstResponder()
            Constants.check = true
            
        }else{
           // Grub-X_0032_check-mark-copy-2
           // Grub-X_0031_Layer-5-copy-2
            
             checkBtn.setImage( UIImage(named:"Grub-X_0031_Layer-5-copy-2"), for: .normal)
            Constants.check = false
            addBtn.isHidden = false
            countTF.isHidden=true
            //checkBtn.isHidden=true
        }
        
        self.delegate?.updateClick(cell: self)
    }
    
    
    @IBAction func addBTnTap(_ sender: Any) {
        self.delegate?.updateCart(cell: self)
    }
    
    
}
