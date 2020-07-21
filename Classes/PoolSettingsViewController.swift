//
//  PoolSettingsViewController.swift
//  Grub X Vender
//
//  Created by MAD-MAC on 18/03/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import KRProgressHUD

class PoolSettingsViewController: UIViewController {

    
    @IBOutlet weak var amountTF: UITextField!
    
    @IBOutlet weak var pincodeTF: UITextField!
    
    
    var succesStatus:Int!
    var messageStatus:String!
    var errorStatus:String!
    
     let userid = UserDefaults.standard.object(forKey: "LoginID") as! Int
    
    override func viewDidLoad() {
        super.viewDidLoad()
        KRProgressHUD.show()
        getPool()
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
             
             self.navigationController?.isNavigationBarHidden = false
             self.navigationItem.title = "Pool Settings"
             self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
                   
             self.navigationController?.navigationBar.tintColor = .white
             self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
             self.navigationController?.navigationBar.isTranslucent = false
             self.navigationController?.view.backgroundColor = .white
                   
               
         }
    
    @IBAction func saveBtn(_ sender: Any) {
        
        if amountTF.text == "" {
            
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message: "Please Enter Amount") {
                
            }
            
        }else if pincodeTF.text == "" {
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message: "Please Enter Pincode") {
                
            }
        }else{
            
            poolPostService()
        }
        
    }
    
    func getPool()  {
             
        
        let token =  UserDefaults.standard.object(forKey: "Token") as! String
                                                
                         
        let header = ["Accept" : "application/json","Authorization" : "Bearer \(token)"]
                           

                           
                  // KRProgressHUD.dismiss()
        Service.shared.GETCallService(serviceType: "http://grubx.srimaruthienterprises.in/api/getpoolsettings/\(userid)") { (response) -> (Void) in
          KRProgressHUD.dismiss()
            let dataDic = response.dictionary
            
            
            let success = dataDic?["success"]?.int
            
            if success == 1 {
            
                              
            let data = dataDic?["data"]?.array
            
            let arrayData = data?[0].dictionary
           
                            
            self.amountTF.text = arrayData?["amount"]?.string ?? "no data"
            self.pincodeTF.text = arrayData?["pincodes"]?.string ?? "no data"
           
            }
                               
                          
        }
             
        
    }
    
    
    
    
    func poolPostService()  {
             
                           
       
        let parameters = ["users_id":String(userid),"amount":amountTF.text ?? "","pincodes":pincodeTF.text ?? ""] as [String : Any]
                     
                     
                                 
        KRProgressHUD.show()
                                  
        Service.shared.POSTService(serviceType:API.contactus, parameters: parameters as [String : Any]) { (response) -> (Void) in
                                     
            KRProgressHUD.dismiss()
                                      
            let responseDic = response.dictionary
                                     
            let result=responseDic!["message"]?.string
                                     
            let successMsg = responseDic?["success"]?.int
                                      
            self.succesStatus = successMsg
                                 
            if self.succesStatus == 1{
           
                self.view.makeToast(result ?? "failed", duration: 1.0, position: .center)
                                            
                                      
            }else{

                                          
                KRProgressHUD.dismiss()

                                           
                self.view.makeToast(result ?? "failed", duration: 1.0, position: .center)
                                       
            }


                                  
        }

             
        
    }
    
}
