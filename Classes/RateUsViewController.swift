//
//  RateUsViewController.swift
//  Grub X Vender
//
//  Created by MAD-MAC on 21/04/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class RateUsViewController: UIViewController {

    
    
    override func viewWillAppear(_ animated: Bool) {
                 
          self.navigationController?.isNavigationBarHidden = false
          self.tabBarController?.tabBar.isHidden = true
          self.navigationItem.title = "About Us"
          self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
          self.navigationController?.navigationBar.tintColor = .white
          self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
          self.navigationController?.navigationBar.isTranslucent = false
          self.navigationController?.view.backgroundColor = .white
              
                    
              
            
      }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

         self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func laterBtn(_ sender: Any) {
        
         self.view.removeFromSuperview()
    }
    
    @IBAction func ratenowBtn(_ sender: Any) {
   DispatchQueue.main.async {
                      let topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
                      topController.showAppUpdateAlert(Version: "Rate Us", Force: true, AppURL:"https://apps.apple.com/us/app/food-xprs/id1484597519")
                  }
    }
    
}

extension UIViewController {
    
    
    func showAppUpdateAlert( Version : String, Force: Bool, AppURL: String) {
        print("AppURL:::::",AppURL)
                let alertController = UIAlertController(title: "RateUS", message: "Do you want to submit your rating through App store?", preferredStyle: .alert)
        
            let notNowButton = UIAlertAction(title: "Not Now", style: .default) { (action:UIAlertAction) in
                print("Don't Call API");
                
                
            }
            alertController.addAction(notNowButton)
       
        let updateButton = UIAlertAction(title: "Yes", style: .default) { (action:UIAlertAction) in
            print("Call API");
            print("No update")
            guard let url = URL(string: AppURL) else {
                return
            }
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
            
        }
        
        alertController.addAction(updateButton)
        self.present(alertController, animated: true, completion: nil)
    }
}
