//
//  DashBoardSettingsViewController.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 19/03/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import KRProgressHUD
class DashBoardSettingsViewController: UIViewController {
    var succesStatus:Int!
       var messageStatus:String!
       var errorStatus:String!
    @IBOutlet weak var primaryDashboardTF: UITextField!
    
    @IBOutlet weak var secondaryDashboardTF: UITextField!
    
    @IBOutlet weak var activityTF: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        KRProgressHUD.show()
        getDashBoard()
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
                
                self.navigationController?.isNavigationBarHidden = false
               self.navigationItem.title = "Dashboard Settings"
                self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
                      
                self.navigationController?.navigationBar.tintColor = .white
                self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                self.navigationController?.navigationBar.isTranslucent = false
                self.navigationController?.view.backgroundColor = .white
                      
                  
            }
    
    
    
    @IBAction func onSaveBtnTap(_ sender: Any) {
        
        
        if primaryDashboardTF.text == "" {
                  
                  SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message: "Please enter  primary Field") {
                      
                  }
                  
              }
        else if secondaryDashboardTF.text == "" {
                  SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message: "Please enter Secondary Field") {
                      
                  }
              }
            else if activityTF.text == "" {
                             SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message: "Please enter Activity Field") {
                                 
                             }
                         }
        else{
                  
                  dashBoardPostService()
              }
        
        
    }
   
    
    func getDashBoard()  {
                     //  KRProgressHUD.dismiss()
           Service.shared.GETCallService(serviceType: "http://grubx.srimaruthienterprises.in/api/getvendordashboardsettings/100)") { (response) -> (Void) in
            KRProgressHUD.dismiss()
               let dataDic = response.dictionary
               
               //print(dataDic)
               let success = dataDic?["success"]?.int
               
               if success == 1 {
               
                                 
               let data = dataDic?["data"]?.array
               
               let arrayData = data?[0].dictionary
              
                               
               self.primaryDashboardTF.text = arrayData?["dasprimary"]?.string ?? "Empty"
               self.secondaryDashboardTF.text = arrayData?["secondary"]?.string ?? "Empty"
                self.activityTF.text=arrayData?["activity"]?.string ?? "Empty"
              
               }
                                  
                             
           }
                
           
       }
    func dashBoardPostService()  {



          let parameters = ["users_id":"100","primary":primaryDashboardTF.text ?? "","secondary":secondaryDashboardTF.text ?? "","activity":activityTF.text ?? ""] as [String : Any]



          KRProgressHUD.show()

          Service.shared.POSTService(serviceType:API.dashboardPost, parameters: parameters as [String : Any]) { (response) -> (Void) in

              KRProgressHUD.dismiss()

              let responseDic = response.dictionary

              let result=responseDic!["message"]?.string

              let successMsg = responseDic?["success"]?.int

              self.succesStatus = successMsg

              if self.succesStatus == 1{

                  self.view.makeToast(result ?? "failed", duration: 1.0, position: .center)


              }else{


                  KRProgressHUD.dismiss()


                  self.view.makeToast(result ?? "failed", duration: 1.0, position: .center)

              }



          }



      }
}
