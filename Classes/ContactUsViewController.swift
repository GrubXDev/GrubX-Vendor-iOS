//
//  ContactUsViewController.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 18/03/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import KRProgressHUD

class ContactUsViewController: UIViewController,UITextViewDelegate {
    
    
    

    @IBOutlet weak var messageTV: UITextView!
  
    @IBOutlet weak var sideMenuBtn: UIBarButtonItem!
    
    var succesStatus:Int!
    var messageStatus:String!
    var errorStatus:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTV.delegate=self
        messageTV.layer.borderWidth = 1
        messageTV.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onSaveBtnTap(_ sender: Any) {
        
        if messageTV.text == "" {
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message: "Please Enter Message") {
                
            }
        }else{
            
            contactus()
        }
    }
      
    func textViewDidBeginEditing(_ textView: UITextView) {
         
          if textView == messageTV {
              messageTV.text = ""
          }
      }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        if Constants.contact == true {
            
            
            self.sideMenuBtn.isEnabled = false
            self.sideMenuBtn.tintColor = UIColor.clear
            let imgBack = UIImage(named: "Grub-X_0054_left-arrow")
                                               
                         navigationController?.navigationBar.backIndicatorImage = imgBack
                         navigationController?.navigationBar.backIndicatorTransitionMaskImage = imgBack
                                               
                         navigationItem.leftItemsSupplementBackButton = true
                         navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        }else{
            print("false")
        }
       
          self.navigationController?.isNavigationBarHidden = false
         
          self.navigationItem.title = "Contact Us"
          self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
                
          self.navigationController?.navigationBar.tintColor = .white
          self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
          self.navigationController?.navigationBar.isTranslucent = false
          self.navigationController?.view.backgroundColor = .white
                
            
      }
    
    
    func contactus(){
             
                           
        let userid = UserDefaults.standard.object(forKey: "LoginID") as! Int
        let parameters = ["users_id":String(userid),"message":messageTV.text ?? ""] as [String : Any]
                     
                     
                                 
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
