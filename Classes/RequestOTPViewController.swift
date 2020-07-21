//
//  RequestOTPViewController.swift
//  Grub X Vender
//
//  Created by vamsikrishna on 23/01/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class RequestOTPViewController: UIViewController {

    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var codeTF: TextField!
    @IBOutlet weak var mobileNoTF: TextField!
    
    
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
        view2.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    @IBAction func requestOtpBtn(_ sender: Any) {
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let gotoOTP = storyBoard.instantiateViewController(withIdentifier: "RequestOTPVerificationViewController") as! RequestOTPVerificationViewController
        self.navigationController?.pushViewController(gotoOTP, animated: true)
    }
    
   
}
