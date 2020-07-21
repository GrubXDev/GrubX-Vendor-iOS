//
//  ProfileViewController.swift
//  Grub X
//
//  Created by MAD-MAC on 03/01/20.
//  Copyright © 2020 My Apps Development. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    override func viewWillAppear(_ animated: Bool) {
        
        
       
         self.navigationController?.isNavigationBarHidden = false
         self.navigationItem.title = "My Account"
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
        if SingleToneClass.shared.isInternetAvailable()==false{
                                
           
            SingleToneClass.shared.showValidationAlert(target: self, title: "No Internet Connection", message:  "Please check your internet connection") {
                                     
                                
            }
                           
        }
        // Do any additional setup after loading the view.
    }

   

    
    
    @IBAction func profileBtn(_ sender: Any) {
            
        let vc = storyboard?.instantiateViewController(withIdentifier: "AccountInformationViewController") as! AccountInformationViewController
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    @IBAction func notificationsBtn(_ sender: Any) {
       
        let vc = storyboard?.instantiateViewController(withIdentifier: "MessagesAndNotificationsViewController") as! MessagesAndNotificationsViewController
                            
        navigationController?.pushViewController(vc, animated: true)
      
    }
    
    
    @IBAction func changePasswordBtn(_ sender: Any) {
     
        let vc = storyboard?.instantiateViewController(withIdentifier: "ChangePasswordViewController") as! ChangePasswordViewController
                     
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    @IBAction func poolSettingsBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "PoolSettingsViewController") as! PoolSettingsViewController
      //  vc.business = "2"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func dashBoardSettingsBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DashBoardSettingsViewController") as! DashBoardSettingsViewController
       // vc.business = "3"
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func settingsBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "NotificationsViewController") as! NotificationsViewController
                     
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func aboutUsBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func contactBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ContactUsViewController") as! ContactUsViewController
                            
        Constants.contact = true
        navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    
    @IBAction func rateUsBtn(_ sender: Any) {
        
            let POPUPVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RateUsViewController") as! RateUsViewController
                         
                   self.addChild(POPUPVC)
                   POPUPVC.view.frame = CGRect.init(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
                   
                   self.view.addSubview(POPUPVC.view)
                   POPUPVC.didMove(toParent: self)
        
        
    }
    @IBAction func signOutBtn(_ sender: Any) {
        
              
        let alert = UIAlertController(title: "LOGOUT", message: "Are you sure,you want to exit?", preferredStyle: .alert)
        
        
        alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: { (confirmAction) in
        
        UserDefaults.standard.removePersistentDomain(forName:Bundle.main.bundleIdentifier!)
                UserDefaults.standard.synchronize()
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: { (cancelAction) in }))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
   
}
