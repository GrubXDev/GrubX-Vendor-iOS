//
//  RequestOTPVerificationViewController.swift
//  Grub X Vender
//
//  Created by vamsikrishna on 23/01/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class RequestOTPVerificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if SingleToneClass.shared.isInternetAvailable()==false{
                                 SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message:  "Please check your internet connection") {
                                     
                                 }
                             }
        // Do any additional setup after loading the view.
    }
    

    

}
