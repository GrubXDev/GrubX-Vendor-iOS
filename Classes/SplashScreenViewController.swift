//
//  SplashScreenViewController.swift
//  Grub X Vender
//
//  Created by MAD-MAC on 06/03/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        if UserDefaults.standard.object(forKey: "LoginID") == nil {
            let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                                   
            let gotoOTP = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                                    
            self.navigationController?.pushViewController(gotoOTP, animated: true)
            
        }else{
            let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                                   
            let gotoOTP = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
                                    
            self.navigationController?.pushViewController(gotoOTP, animated: true)
        }
       
    }
    
}
