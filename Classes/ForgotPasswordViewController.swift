//
//  ForgotPasswordViewController.swift
//  Grub X Vender
//
//  Created by vamsikrishna on 22/01/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailOrPhoneTF: TextField!
    
    @IBOutlet weak var resetBtn: UIButton!
    
    
    
    
   
    override func viewWillAppear(_ animated: Bool) {
       
        
       
        let imgBack = UIImage(named: "Grub-X_0054_left-arrow")
                              
        navigationController?.navigationBar.backIndicatorImage = imgBack
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = imgBack
                              
        navigationItem.leftItemsSupplementBackButton = true
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
           self.navigationController?.isNavigationBarHidden = false
           self.tabBarController?.tabBar.isHidden = true
           self.navigationItem.title = "Forgot Password"
           self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
           self.navigationController?.navigationBar.tintColor = .white
           self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
           self.navigationController?.navigationBar.isTranslucent = false
           self.navigationController?.view.backgroundColor = .white
    
          
    
    }
      
    override func viewDidLoad() {
        super.viewDidLoad()
        if SingleToneClass.shared.isInternetAvailable()==false{
                               
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message:  "Please check your internet connection") {
                                     
                                
            }
                             
        }
        resetBtn.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    @IBAction func resetBtn(_ sender: Any) {
      
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let gotoOTP = storyBoard.instantiateViewController(withIdentifier: "OTPValidationViewController") as! OTPValidationViewController
        self.navigationController?.pushViewController(gotoOTP, animated: true)
        
    }
    
   

}
