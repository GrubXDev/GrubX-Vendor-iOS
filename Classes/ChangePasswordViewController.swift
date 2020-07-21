//
//  ChangePasswordViewController.swift
//  Grub X
//
//  Created by MAD-MAC on 09/01/20.
//  Copyright © 2020 My Apps Development. All rights reserved.
//

import UIKit
import Alamofire
import KRProgressHUD
class ChangePasswordViewController: UIViewController {
   
    
    var succesStatus:Int!
        var messageStatus:String!
        var errorStatus:String!
 let email = UserDefaults.standard.object(forKey: "email") as! String
  
    
    
    @IBOutlet weak var saveBtnView: UIView!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var newPasswordTF: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var oldPasswordTF: UITextField!
     
       override func viewWillAppear(_ animated: Bool) {
           
           let imgBack = UIImage(named: "Grub-X_0054_left-arrow")
                                              
                        navigationController?.navigationBar.backIndicatorImage = imgBack
                        navigationController?.navigationBar.backIndicatorTransitionMaskImage = imgBack
                                              
                        navigationItem.leftItemsSupplementBackButton = true
                        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
          
            self.navigationController?.isNavigationBarHidden = false
                self.navigationItem.title = "Change Password"
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
           // self.tabBarController?.tabBar.barTintColor = UIColor(red: 113/255, green: 188/255, blue: 121/255, alpha: 1.0)
            self.navigationController?.navigationBar.tintColor = .white
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.view.backgroundColor = .white
          
         //  SingleToneClass.shared.showProgressLoading(title: "Please Wait")

        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
               
        saveBtnView.layer.shadowColor = UIColor.black.cgColor
//        saveBtn.layer.borderWidth = 1
//        saveBtn.layer.borderColor = UIColor.black.cgColor
        saveBtnView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        saveBtnView.layer.shadowOpacity = 1
        
        
        if SingleToneClass.shared.isInternetAvailable()==false{
                               
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message:  "Please check your internet connection") {
                                     
                                 
            }
                             
        }
        self.saveBtn.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func onSaveBtnTap(_ sender: Any) {
        if oldPasswordTF.text?.count==0 {
                                                  
                   SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter oldpassword") {
                       self.oldPasswordTF.becomeFirstResponder()
                                                  }
                                                  
                                                  
                       } else if newPasswordTF.text?.count==0 {
                                                  
                       SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter new password") {
                       self.newPasswordTF.becomeFirstResponder()
                                                  }
                                                  
                                              }
        else if confirmPasswordTF.text?.count==0 {
                                   
        SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter confirm password") {
        self.confirmPasswordTF.becomeFirstResponder()
                                   }
                                   
                               }
        else{
            if newPasswordTF.text==confirmPasswordTF.text{
            api()
            }
            else{
                 SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "New Password and confirm password needs to be same") {
                        self.confirmPasswordTF.becomeFirstResponder()
                                                   }
            }
        }
        
        
        
    }
    func api(){
        
          let userid = UserDefaults.standard.object(forKey: "LoginID") as! Int
                print(userid)
        let parameters = ["email":email,"password":newPasswordTF.text!,"oldpassword":oldPasswordTF.text!] as [String : Any]
                     KRProgressHUD.show()
                     Service.shared.POSTService(serviceType:API.changePasword, parameters: parameters as [String : Any]) { (response) -> (Void) in
                         KRProgressHUD.dismiss()
                         print(response)
                         let responseDic = response.dictionary
                        let result=responseDic!["message"]?.string
                         let successMsg = responseDic?["success"]?.int
                         self.succesStatus = successMsg
                    if self.succesStatus == 1{
                           
                        SingleToneClass.shared.showValidationAlert(target: self, title: "Success", message: result ?? "failed") {
                              let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
                                     
                              self.navigationController?.pushViewController(vc!, animated: true)
                                
                            }
                            
                         }else{
                            
                             KRProgressHUD.dismiss()

                              self.view.makeToast(result ?? "failed", duration: 1.0, position: .center)
                         }
                         
                         
                     }
                     
                     
       
    }
    
}
