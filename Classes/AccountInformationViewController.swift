//
//  AccountInformationViewController.swift
//  Grub X Vender
//
//  Created by Shreyash Shriyam on 02/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import Kingfisher
class AccountInformationViewController: UIViewController {
   
    @IBOutlet weak var profileImgView: UIImageView!
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var mobileTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var businessNameTF: UITextField!
    @IBOutlet weak var businessAddressTF: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
         
        let imgBack = UIImage(named: "Grub-X_0054_left-arrow")
                                     
               navigationController?.navigationBar.backIndicatorImage = imgBack
               navigationController?.navigationBar.backIndicatorTransitionMaskImage = imgBack
                                     
               navigationItem.leftItemsSupplementBackButton = true
               navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
          self.navigationController?.isNavigationBarHidden = false
          self.navigationItem.title = "Profile"
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
        self.mobileTF.text = UserDefaults.standard.object(forKey: "phone") as? String
        self.nameTF.text = UserDefaults.standard.object(forKey: "Name") as? String
        self.emailTF.text = UserDefaults.standard.object(forKey: "email") as? String
        self.businessNameTF.text = UserDefaults.standard.object(forKey: "BusinessName") as? String
        self.businessAddressTF.text = UserDefaults.standard.object(forKey: "Address") as? String
        
        let profileImages = UserDefaults.standard.object(forKey: "profileImage") as? String
              
              
              pathofpic = profileImages
              
              print(pathofpic)


              if let imageUrl = pathofpic{
                          
                          
                  let url = URL(string: imageUrl)
                                 
                  print(url as Any)
                                               
                  self.profileImgView.kf.setImage(with: url)

              }
              
              profileImgView.layer.cornerRadius =  profileImgView.bounds.size.width / 2
              self.profileImgView.clipsToBounds = true
              
              
              
              
        
        
        
        if SingleToneClass.shared.isInternetAvailable()==false{
                                 
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message:  "Please check your internet connection") {
                                     
                                
            }
                            
        }
        // Do any additional setup after loading the view.
    }
    
}
