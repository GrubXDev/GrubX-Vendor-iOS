//
//  PlacedOrdersTableViewCell.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 27/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
protocol PlacedOrdersTableViewCellDelegate :AnyObject{
    
    
   
    func updateClick(cell: PlacedOrdersTableViewCell)
    
}
class PlacedOrdersTableViewCell: UITableViewCell,UITableViewDelegate,UITableViewDataSource {
    
     var delegate : PlacedOrdersTableViewCellDelegate?
    var selection=false
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=bottomTblView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! BottomTableViewCell
        return cell
    }
    
    @IBOutlet weak var orderNoLbl: UILabel!
    
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var plusBtn: UIButton!
    
    @IBOutlet weak var bottomTblView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var topView: UIView!
   
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//         topView.layer.masksToBounds = false
//                             topView.layer.shadowColor = UIColor.lightGray.cgColor
//                             topView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//                             topView.layer.shadowOpacity = 0.5
//        topView.layer.cornerRadius=5
//        bottomView.layer.masksToBounds = false
//                             bottomView.layer.shadowColor = UIColor.lightGray.cgColor
//                             bottomView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//                             bottomView.layer.shadowOpacity = 0.5
//        bottomView.layer.cornerRadius=5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func plusBtnTap(_ sender: Any) {
        
        if Constants.check == false {
                   
            self.bottomView.isHidden=true
                   
               }else{
                  // Grub-X_0032_check-mark-copy-2
                  // Grub-X_0031_Layer-5-copy-2
                   
            self.bottomView.isHidden=false
                   //checkBtn.isHidden=true
               }
               
               self.delegate?.updateClick(cell: self)
        
        
        
        
   // selection=true
        //bottomView.isHidden=false
            }
    
//    func registerTableView<DataSource:UITableViewDataSource>(datasource:DataSource){
//        self.bottomTblView.dataSource=datasource
//    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//           return 10
//       }
//
//       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//           let cell=tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlacedOrdersTableViewCell
//           cell.registerTableView(datasource: self)
//
//           //cell.plusBtn.addTarget(self, action: #selector(self.editTapped(_:)), for: .touchUpInside)
//           return cell
//       }
    
   
}
