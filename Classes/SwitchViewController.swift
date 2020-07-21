//
//  SwitchViewController.swift
//  Grub X
//
//  Created by MAD-MAC on 10/01/20.
//  Copyright © 2020 My Apps Development. All rights reserved.
//

import UIKit
import ObjectMapper
import AlamofireObjectMapper
import Alamofire
import KRProgressHUD
//after placed order
class SwitchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource ,businessData{
    
    var updatedid=String()
    var unchecked = true
    var statusArray=[String]()
    var allids=[String]()
    var catData:[GetBusiness] = []
    var businessname:String!
    var ownersName:String!
    var address:String!
    var goods:String!
    var addressStg = String()
    var businessId:String!
    
    let businessid = UserDefaults.standard.object(forKey: "userBusinessId") as! String
    var token =  UserDefaults.standard.object(forKey: "Token") as! String
    let login = UserDefaults.standard.object(forKey: "LoginID") as! Int
    
    @IBOutlet weak var radioBtn: DLRadioButton!
    @IBOutlet weak var businessTableview: UITableView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view2: UIView!
    
    func finishPassing(name: String, ownerName: String, address: String, goods: String) {
        
    }
   
    
    
    var businessNamesArr = [String]()
    

    
    override func viewWillAppear(_ animated: Bool) {
     
       
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Business"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
       
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = .white
        


     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        KRProgressHUD.show()
    if SingleToneClass.shared.isInternetAvailable()==false{
                        
        SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message:  "Please check your internet connection") {
                                    
                               
        }
                            
        }
        getBusiness()
        
    }
    
   
    func getBusiness(){

                                    
        let header = ["Accept" : "application/json","Authorization" : "Bearer \(token)"]
      //  print(login)
        
        Alamofire.request("http://grubx.srimaruthienterprises.in/api/business/\(login)",headers: header).responseObject { (response: DataResponse<AllBusiness>) in
                KRProgressHUD.dismiss()
                       
            let initialresponse = response.result.value
                  
            if let resultdata = initialresponse?.data {
                       
                for data in resultdata {
                                  
                    self.allids.append(data.id!)
                                 
                                 
                    self.businessId = data.id
                                  
                    self.ownersName = data.ownerName
                                 
                    self.businessname = data.businessName
                    self.address = data.address
                    self.goods = data.goods
                    self.addressStg = self.ownersName + "," + self.businessname + "," + self.address + "," + self.goods
                                  
                    self.businessNamesArr.append(self.addressStg)
                               
                }
                     
                        
                self.businessTableview.reloadData()
         
            }
                
                       
        }
        
        
           
       
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
           return businessNamesArr.count
       
    }
       
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        let cell = businessTableview.dequeueReusableCell(withIdentifier: "SwitchTableviewcell", for: indexPath) as! SwitchTableviewcell
        cell.editBtn.tag=indexPath.row
        cell.businessLbl.text = self.businessNamesArr[indexPath.row]
  cell.editBtn.addTarget(self, action: #selector(self.editTapped(_:)), for: .touchUpInside)
     
        if self.allids[indexPath.row]==(self.businessid){
            
            
        cell.radioBtn.setImage(UIImage(named:"Grub-X_0032_check-mark-copy-2"), for: .highlighted)
      
            cell.radioBtn.layer.cornerRadius=10
             
            cell.radioBtn.isSelected=true
            cell.radioBtn.indicatorColor=UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
            
        }

          
        return cell
       
    }
   @IBAction func editTapped(_ sender:UIButton){
               selectedIndexes=sender.tag
    print(selectedIndexes)
              let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                                      let gotoOTP = storyBoard.instantiateViewController(withIdentifier: "AddBusinessViewController") as! AddBusinessViewController
    gotoOTP.from="productsEdit"
    gotoOTP.edit=[self.businessNamesArr[sender.tag]]
               
                                       self.navigationController?.pushViewController(gotoOTP, animated: true)
           }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                   
        let alert = UIAlertController(title: "GRUBX", message: "Do you want to switch business?", preferredStyle: .alert)
                           
                           
                   
        alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: { (confirmAction) in
                           
                      
            self.updatedid=self.allids[indexPath.row]
                      
            self.updateBusiness()
                   
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
                           
                   
            self.navigationController?.pushViewController(vc!, animated: true)
                           
                         
                           
                   
        }))
                           
                   
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: { (cancelAction) in }))
                           
                   
        present(alert, animated: true, completion: nil)

    
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
   func updateBusiness(){
              
    KRProgressHUD.show()
                                                
    let header = ["Accept" : "application/json","Authorization" : "Bearer \(token)"]
    Alamofire.request("http://grubx.srimaruthienterprises.in/api/switchbusiness/\(self.updatedid)/\(login)", method: .put, encoding: JSONEncoding.default, headers: header).responseJSON { response in
                  
        KRProgressHUD.dismiss()
       
        let statusCode = response.response?.statusCode
             
        if statusCode == 200{
                        
                     
            do{
                           
                          
                if let json = try JSONSerialization.jsonObject(with: response.data!, options:.allowFragments) as? [String: Any]{
                                
                      
                    let success = json["message"] as! String
                    if success == "Switch Business activated successfully"{

                    
                        SingleToneClass.shared.showValidationAlert(target: self, title: "Success", message: "Switch Business activated successfully") {
                                        
                                      
                            UserDefaults.standard.synchronize()
                            let domain = Bundle.main.bundleIdentifier!
                                              
                            UserDefaults.standard.removePersistentDomain(forName: domain)
                            
                            UserDefaults.standard.synchronize()
                                        
                                   
                        }
                                    
                              
                    }
                           
                }
                              
                       
            } catch {
                           
                print(error.localizedDescription)
                       
            }
                   
        }
                    
          
    }
            
    
    }
    
    
    @IBAction func onPlusBtnTap(_ sender: Any) {
        
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
            let gotoOTP = storyBoard.instantiateViewController(withIdentifier: "AddBusinessViewController") as! AddBusinessViewController
        gotoOTP.from="plus"
        self.navigationController?.pushViewController(gotoOTP, animated: true)
        
        
    }
    
  
   
}


