//
//  FinalProductsTableViewCell.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 27/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class FinalProductsTableViewCell: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var categoryNameLbl: UILabel!
    @IBOutlet weak var collView: UICollectionView!
    
   

   
    
//func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//
//    let cellWidth: CGFloat = 130 // Your cell width
//
//    let numberOfCells = floor(collView.frame.size.width / cellWidth)
//    let edgeInsets = (collView.frame.size.width - (numberOfCells * cellWidth)) / (numberOfCells + 1)
//
// return UIEdgeInsets(top: 0, left: edgeInsets, bottom: 0, right: edgeInsets)
//}
  
    override func awakeFromNib() {
        super.awakeFromNib()
       self.collView.dataSource = self
        self.collView.delegate = self
      //  self.collView.register(UINib.init(nibName: "FinalProductsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FinalProductsCollectionViewCell")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 10
       }

      
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          
        let cell=collView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCellCollectionViewCell

          return cell
       }
    
}
