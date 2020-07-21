//
//  AboutUsViewController.swift
//  Grub X Vender
//
//  Created by MAD-MAC on 21/04/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import KRProgressHUD
class AboutUsViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var abtusData:[AboutUsData] = []
    
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
        KRProgressHUD.show()
        api()
        // Do any additional setup after loading the view.
    }
    
    func api(){
          
          let accessToken = UserDefaults.standard.object(forKey:"Token") as! String
                       let header = ["Accept" : "application/json","Authorization" : "Bearer \(accessToken)"]
                    
                       Alamofire.request(API.aboutUs,headers: header).responseObject { (response: DataResponse<AboutUs>) in
                           
                      KRProgressHUD.dismiss()

                                   print(response)
                                   let initialresponse = response.result.value
                                     
                           if let resultdata = initialresponse?.data {
                                                                  for data in resultdata {
                                                                    self.textView.text=data.descriptionField
                                             self.abtusData.append(data)
                                         }
                                     
                                         
                                     }
                                 }
                      
                 
                 
          
          
          
      }
}
