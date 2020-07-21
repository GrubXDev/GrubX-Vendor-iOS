//
//  ContinueAsGuestViewController.swift
//  Grub X Vender
//
//  Created by MAD-MAC on 16/03/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class ContinueAsGuestViewController: UIViewController {

    
    @IBOutlet weak var confirmBtn: UIButton!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmBtn.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        
      self.navigationController?.popViewController(animated: true)
    }
    @IBAction func confirmBtn(_ sender: Any) {
    }
    
      override func viewWillAppear(_ animated: Bool) {
       
           self.navigationController?.isNavigationBarHidden = true
           self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
           self.navigationController?.navigationBar.tintColor = .white
           self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
           self.navigationController?.navigationBar.isTranslucent = false
           self.navigationController?.view.backgroundColor = .white
    
          
       }


}
