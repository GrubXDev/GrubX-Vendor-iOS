//
//  TabBarViewController.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 19/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if SingleToneClass.shared.isInternetAvailable()==false{
                               
            SingleToneClass.shared.showValidationAlert(target: self, title: "No Internet Connection", message:  "Please check your internet connection") {
                                     
                                
            }
                            
        }
          self.navigationController?.isNavigationBarHidden = true
          //self.navigationItem.title = "Home"
    }
    

    

}
