//
//  NotificationsViewController.swift
//  Grub X
//
//  Created by MAD-MAC on 09/01/20.
//  Copyright © 2020 My Apps Development. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {

    
    
    override func viewWillAppear(_ animated: Bool) {
               
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.title = "Notification"
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
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
