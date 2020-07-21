//
//  InviteScreenViewController.swift
//  Grub X Vender
//
//  Created by MAD-MAC on 23/04/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
import KRProgressHUD
import Toast_Swift
class InviteScreenViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var tblView: UITableView!
    var buyersData:[AllBuyersData] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buyersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as! InviteTableViewCell
        
        cell.businessNAmeLbl.text=buyersData[indexPath.row].businessName ?? "empty"
        cell.zipcodeLBL.text=buyersData[indexPath.row].pincode ?? "empty"
        cell.mbleLbl.text=buyersData[indexPath.row].phone ?? "empty"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func viewWillAppear(_ animated: Bool) {
                   
            self.navigationController?.isNavigationBarHidden = false
            self.tabBarController?.tabBar.isHidden = true
            self.navigationItem.title = "Invite"
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
            self.navigationController?.navigationBar.tintColor = .white
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.view.backgroundColor = .white
                
                      
                
              
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        KRProgressHUD.show()
        api()
        // Do any additional setup after loading the view.
    }
    
     func api(){
          
       buyersData.removeAll()
        
        let accessToken = UserDefaults.standard.object(forKey: "Token") as! String
        
        let header = ["Accept" : "application/json","Authorization" : "Bearer \(accessToken)"]

        
        Alamofire.request(API.allBuyers,headers: header).responseObject { (response: DataResponse<AllBuyers>) in
            //print(DataResponse<AllBuyers>.self)
            KRProgressHUD.dismiss()
            let initialresponse = response.result.value
            if let resultdata = initialresponse?.data {
            for data in resultdata {
            self.buyersData.append(data)
    
                }
                print(self.buyersData)
                self.tblView.reloadData()
                
            }
            
        }

       }
    

}
