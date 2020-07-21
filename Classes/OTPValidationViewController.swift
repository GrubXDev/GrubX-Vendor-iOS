//
//  OTPValidationViewController.swift
//  Grub X Vender
//
//  Created by vamsikrishna on 22/01/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class OTPValidationViewController: UIViewController {

    
    @IBOutlet weak var otp1TF: UITextField!
    @IBOutlet weak var otp2TF: UITextField!
    @IBOutlet weak var mobileNoLbl: UILabel!
    @IBOutlet weak var verifyBtn: UIButton!
    @IBOutlet weak var otp4TF: UITextField!
    @IBOutlet weak var otp3TF: UITextField!
  
    
    
    override func viewWillAppear(_ animated: Bool) {
       
         
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
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
        verifyBtn.layer.cornerRadius = 10
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func verifyBtn(_ sender: Any) {
    }
    
    @IBAction func resendBtn(_ sender: Any) {
    }
   
}
