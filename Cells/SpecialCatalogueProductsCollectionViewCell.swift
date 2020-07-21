//
//  SpecialCatalogueProductsCollectionViewCell.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 28/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
protocol SpecialCatalogueProductsCollectionViewCellDelegate :AnyObject{
   
    func updateCart(cell: SpecialCatalogueProductsCollectionViewCell)
    func updateTF(cell: SpecialCatalogueProductsCollectionViewCell)
    func updateClick(cell: SpecialCatalogueProductsCollectionViewCell)
    
}


class SpecialCatalogueProductsCollectionViewCell: UICollectionViewCell {
    
    
    var delegate : SpecialCatalogueProductsCollectionViewCellDelegate?
    var sample=[String]()
   
    
    @IBOutlet weak var priceLbl: UILabel!
    
    @IBOutlet weak var checkboxBtn: UIButton!
    @IBOutlet weak var countTF: UITextField!
 
    @IBOutlet weak var countStackView: UIStackView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var addBtn: UIButton!

    
    var count = 0
  
    
    override func awakeFromNib() {
            
        super.awakeFromNib()
           
      
            
        topView.layer.masksToBounds = false
                                   
        topView.layer.shadowColor = UIColor.lightGray.cgColor
                                   
        topView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
                                   
        topView.layer.shadowOpacity = 0.5
       
        topView.layer.cornerRadius=10
          
    }
   
    @IBAction func checkBoxTap(_ sender: Any) {
        
        
        if Constants.check == false {
            
           // checkBtn.setImage("Grub-X_0031_Layer-5-copy-2", for: .normal)
              checkboxBtn.setImage( UIImage(named:"Grub-X_0032_check-mark-copy-2"), for: .normal)
            addBtn.isHidden=true
           // countTF.isHidden=false
            countStackView.isHidden = false
            countTF.becomeFirstResponder()
            Constants.check = true
            
        }else{
           // Grub-X_0032_check-mark-copy-2
           // Grub-X_0031_Layer-5-copy-2
            
             checkboxBtn.setImage( UIImage(named:"Grub-X_0031_Layer-5-copy-2"), for: .normal)
            Constants.check = false
            addBtn.isHidden = false
            //countTF.isHidden=true
            countStackView.isHidden = true
            //checkBtn.isHidden=true
        }
        
        self.delegate?.updateClick(cell: self)

        
    }
    
    
    @IBAction func btnAction(_ sender: Any) {
        
        self.delegate?.updateCart(cell: self)
        
    }
    
 
    
    @IBAction func countTF(_ sender: UITextField) {
        
         self.delegate?.updateTF(cell: self)
        
    }
    
   
}
