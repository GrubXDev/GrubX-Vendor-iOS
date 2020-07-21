//
//  AddBusinessViewController.swift
//  Grub X
//
//  Created by MAD-MAC on 10/01/20.
//  Copyright © 2020 My Apps Development. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
protocol businessData {
    func finishPassing(name: String,ownerName : String,address:String,goods:String)
}
class AddBusinessViewController: UIViewController {
    
 var from=String()
    var edit=[String]()
//    var businessName:String!
//    var ownersName:String!
//    var address:String!
//    var goods:String!
//    var userid:String!
   
    
    var delegate: businessData?
    @IBOutlet weak var businessNameTF: UITextField!
    @IBOutlet weak var businessOwnerNameTF: UITextField!
    @IBOutlet weak var businessAddressTF: UITextField!
    @IBOutlet weak var servedGoodsTF: UITextField!
    
    @IBOutlet weak var employeePinTF: UITextField!
    
    @IBOutlet weak var businessPhoneNumberTF: UITextField!
    
    @IBOutlet weak var businessWebsiteUrlTF: UITextField!
    
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    
    @IBOutlet weak var sidemenuBtn: UIBarButtonItem!
    
    
     var name1Array = ["Business Name","Business Owner Name","Business Address","Served Business Goods"]
     var name2Array = ["SR Stocking","Albert Dex","Alberta Street 08","Meat,Beverage,Food"]
     
     var business = String()
     
     var name3Array = ["Minimum Rupees Required For Pooling","Pooling Available only"]
     var name4Array = ["15000","Canada,Alberts State"]
     
     var name5Array = ["Primary DashBoard","Scondary DashBoard","Activity Shown"]
     var name6Array = ["Sales","Orders,Buyers,Products","One Week"]
    
    
    
    
    @IBAction func saveTap(_ sender: Any) {
        
       
        if businessNameTF.text?.count==0 {

                
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter Businessname") {
                    
                self.businessNameTF.becomeFirstResponder()
                                                
            }


                      
        }else if businessOwnerNameTF.text?.count==0 {

                     
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter businessownername") {
                     
                self.businessOwnerNameTF.becomeFirstResponder()
                                                
            }

                                            
        }else if businessAddressTF.text!.count == 0 {

                
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter business address") {
                 
                self.businessAddressTF.becomeFirstResponder()
                                            
            
            }

                                        
        }else if businessPhoneNumberTF.text!.count == 0 {

                           
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter business phoneNumber") {
                            
                self.businessPhoneNumberTF.becomeFirstResponder()
                                                      
            }

                                                   
        }else if servedGoodsTF.text?.count==0 {

                  SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter served business goods") {
                  self.servedGoodsTF.becomeFirstResponder()
                                            
            }

                                        
        }else if employeePinTF.text?.count==0 {

                          
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter employee pin") {
                           
                self.employeePinTF.becomeFirstResponder()
                                                     
            }

                                                   
        }else if businessWebsiteUrlTF.text?.count==0 {

                                      
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter business website url") {
                                     
                self.businessWebsiteUrlTF.becomeFirstResponder()
                                                                 
            }

                                                            
        }else{
        addBusinessApi()
        //delegate?.finishPassing(name: businessNameTF.text!, ownerName: businessOwnerNameTF.text!, address: businessAddressTF.text!, goods: servedGoodsTF.text!)
        }
        
    }
    
    
    
   
    
    
    
 
    
    override func viewWillAppear(_ animated: Bool) {
     
       
        if business == "2" || business == "3" || self.from=="productsEdit" || self.from=="plus" {
            self.navigationItem.title="Edit Business"
            self.sidemenuBtn.isEnabled = false
            self.sidemenuBtn.tintColor = UIColor.clear
            let imgBack = UIImage(named: "Grub-X_0054_left-arrow")
                   
            navigationController?.navigationBar.backIndicatorImage = imgBack
            navigationController?.navigationBar.backIndicatorTransitionMaskImage = imgBack
                   
            navigationItem.leftItemsSupplementBackButton = true
            navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
                   
        }
        else{
        
        self.navigationController?.isNavigationBarHidden = false
        
        
         self.navigationItem.title = "Add Business"
         self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
       
         self.navigationController?.navigationBar.tintColor = .white
         self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
         self.navigationController?.navigationBar.isTranslucent = false
         self.navigationController?.view.backgroundColor = .white
       
        }


     }
   
    override func viewDidLoad() {
        super.viewDidLoad()

      
        
        if from == "productsEdit"{
            print(self.edit)
                  var str = self.edit[0]
                  var strArray = str.components(separatedBy: ",")
            self.businessOwnerNameTF.text=strArray[0]
            
            self.businessNameTF.text=strArray[1]
            self.businessAddressTF.text=strArray[2]
            self.servedGoodsTF.text=strArray[3]
        }
        
        view1.layer.masksToBounds = false
        view1.layer.shadowColor = UIColor.black.cgColor
        view1.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view1.layer.shadowOpacity = 0.5
        
        view2.layer.masksToBounds = false
        view2.layer.shadowColor = UIColor.black.cgColor
        view2.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view2.layer.shadowOpacity = 0.5
        
        view3.layer.masksToBounds = false
        view3.layer.shadowColor = UIColor.black.cgColor
        view3.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view3.layer.shadowOpacity = 0.5
        
        view4.layer.masksToBounds = false
        view4.layer.shadowColor = UIColor.black.cgColor
        view4.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view4.layer.shadowOpacity = 0.5
        
        view5.layer.masksToBounds = false
        view5.layer.shadowColor = UIColor.black.cgColor
        view5.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view5.layer.shadowOpacity = 0.5
        
        view6.layer.masksToBounds = false
        view6.layer.shadowColor = UIColor.black.cgColor
        view6.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view6.layer.shadowOpacity = 0.5
        
        view7.layer.masksToBounds = false
        view7.layer.shadowColor = UIColor.black.cgColor
        view7.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view7.layer.shadowOpacity = 0.5
        
       
      
        
        if SingleToneClass.shared.isInternetAvailable()==false{
                          
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message:  "Please check your internet connection") {
                              
                         
            }
                     
        }
        // Do any additional setup after loading the view.
    }
    

    func addBusinessApi(){
       
        let login = UserDefaults.standard.object(forKey: "LoginID") as! Int
        print(login)
        let parameters = ["business_name":self.businessNameTF.text!,"owner_name":self.businessOwnerNameTF.text!,"address":self.businessAddressTF.text!,"goods":self.servedGoodsTF.text!,"users_id":login,"emp_pin":self.employeePinTF,"website_url":self.businessWebsiteUrlTF] as [String : Any]
       
        Service.shared.POSTService(serviceType: API.addBusiness, parameters: parameters) { (response) -> (Void) in
            print(response)
            let success = response["success"].int
                      
            let data = response["data"].dictionary
            let id = data?["id"]?.int
                      
            if success == 1{
                          
                DispatchQueue.main.async {

                         
                    let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                    let gotoOTP = storyBoard.instantiateViewController(withIdentifier: "SwitchViewController") as! SwitchViewController
                    self.navigationController?.pushViewController(gotoOTP, animated: true)
                                                                     
                }
                      
            }else{
                           
                      
            }
            
       
        }
       
        
        
        


}
}
