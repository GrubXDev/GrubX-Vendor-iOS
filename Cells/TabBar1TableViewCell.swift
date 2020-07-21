//
//  TabBar1TableViewCell.swift
//  Grub X Vender
//
//  Created by MAD-MAC on 05/03/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class TabBar1TableViewCell: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var categoryNameLbl: UILabel!
    @IBOutlet weak var collection: UICollectionView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        self.collection.dataSource = self
        self.collection.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 10
       }

      
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TabBar1CollectionViewCell

          return cell
       }

}
