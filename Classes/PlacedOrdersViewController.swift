//
//  PlacedOrdersViewController.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 27/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import KRProgressHUD


class PlacedOrdersViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
 
    
    var placedOrdersData:[PlacedOrdersData] = []
    var selectedIndex = -1
    var isCollapse = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 10
        //return placedOrdersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlacedOrdersTableViewCell
//        cell.orderNoLbl.text=placedOrdersData[indexPath.row].placeordersId
//         cell.statusLbl.text="on Going"
        cell.plusBtn.tag=indexPath.row
        cell.plusBtn.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)

        return cell
    }
    
    @objc func buttonTapped(sender : UIButton){
        
        print("plus btn clicked")
    
        if selectedIndex == sender.tag {
                 
            if self.isCollapse == false {
                       
                self.isCollapse = true
                   
            }else{
                     
                self.isCollapse = false
                   
            }
               
        }else{
                 
            self.isCollapse = true

               
        }
              
        self.selectedIndex = sender.tag
      
        tblView.reloadData()
    }

    @IBOutlet weak var tblView: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        KRProgressHUD.show()
        api()
      
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
          
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Placed Orders"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = .white
                 
              
       }
 
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    
   // let cell = self.tblView.cellForRow(at: indexPath) as! PlacedOrdersTableViewCell

        
    if self.selectedIndex == indexPath.row && isCollapse == true {
           
    
           
        return 300
          
    }else{
          
        
            
        return 60
         
    }
      
    }
  
    
    
    func api(){
            
           
        let accessToken = UserDefaults.standard.object(forKey:"Token") as! String
                        
        let header = ["Accept" : "application/json","Authorization" : "Bearer \(accessToken)"]
                      
                         
        Alamofire.request(API.placedOrders,headers: header).responseObject { (response: DataResponse<PlacedOrders>) in
                             
                       
            KRProgressHUD.dismiss()

                                    
            print(response)
                                    
            let initialresponse = response.result.value
                                       
                            
            if let resultdata = initialresponse?.data {
                                                                   
                for data in resultdata {
                                                                       
                    self.placedOrdersData.append(data)
                    
                                          
                }
                print(self.placedOrdersData)
                self.tblView.reloadData()
                                           
                                      
            }
                                  
        }
    
            
        }

}
