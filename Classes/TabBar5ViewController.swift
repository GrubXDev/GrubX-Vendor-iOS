//
//  TabBar5ViewController.swift
//  Grub X Vender
//
//  Created by Ashish dattu on 25/01/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import KRProgressHUD
class TabBar5ViewController: UIViewController {
var dashBoarddata:[DashboardData] = []
    @IBOutlet weak var todaySalesCountLbl: UILabel!
    
    @IBOutlet weak var productCountLbl: UILabel!
    
    @IBOutlet weak var ordersCompletedLbl: UILabel!
    
    @IBOutlet weak var ordersPendingLbl: UILabel!
    
    @IBOutlet weak var ordersCancelledLbl: UILabel!
    
    @IBOutlet weak var buyersNewLbl: UILabel!
    
    @IBOutlet weak var buyersActiveLbl: UILabel!
    
    @IBOutlet weak var buyersInactiveLbl: UILabel!
    
    @IBOutlet weak var productsNewLbl: UILabel!
    
    @IBOutlet weak var productsTopSellLbl: UILabel!
    
    @IBOutlet weak var productsLessSaleLbl: UILabel!
    
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var view8: UIView!
    @IBOutlet weak var view9: UIView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
      //  scrollViewDidEndDecelerating(collection)
     self.navigationItem.title = "Dashboard"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = .white
           
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for:[])


         
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        KRProgressHUD.show()
        api()
        
        if SingleToneClass.shared.isInternetAvailable()==false{
                              
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message:  "Please check your internet connection") {
                                     
                                
            }
                            
        }
        mainView.layer.cornerRadius = mainView.bounds.size.width/2;
        mainView.layer.masksToBounds = true
        mainView.layer.borderColor = UIColor.gray.cgColor
        mainView.layer.borderWidth = 1

        
        view1.layer.cornerRadius = view1.bounds.size.width/2;
        view1.layer.masksToBounds = true
       
        
        view2.layer.cornerRadius = view2.bounds.size.width/2;
        view2.layer.masksToBounds = true
        
        
        view3.layer.cornerRadius = view3.bounds.size.width/2;
        view3.layer.masksToBounds = true
       
        view4.layer.cornerRadius = view4.bounds.size.width/2;
        view4.layer.masksToBounds = true
        
        view5.layer.cornerRadius = view5.bounds.size.width/2;
        view5.layer.masksToBounds = true
        
        view6.layer.cornerRadius = view6.bounds.size.width/2;
        view6.layer.masksToBounds = true
        
        view7.layer.cornerRadius = view7.bounds.size.width/2;
        view7.layer.masksToBounds = true
        
        view8.layer.cornerRadius = view8.bounds.size.width/2;
        view8.layer.masksToBounds = true
        
        view9.layer.cornerRadius = view9.bounds.size.width/2;
        view9.layer.masksToBounds = true
        
    }
    

   
    
    @IBAction func bellBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "MessagesAndNotificationsViewController") as! MessagesAndNotificationsViewController
                            
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func api(){
        
        
                          let accessToken = UserDefaults.standard.object(forKey: "Token") as! String
                                  let header = ["Accept" : "application/json","Authorization" : "Bearer \(accessToken)"]
                  
                           Alamofire.request(API.dashboard,headers: header).responseObject { (response: DataResponse<Dashboard>) in
                   KRProgressHUD.dismiss()
                                 let initialresponse = response.result.value
                                 
                               if let resultdata = initialresponse?.data {
                                     for data in resultdata {
                                        //let tdysales = "\(data.todaysSale ?? 0)"
                                        self.todaySalesCountLbl.text="\(data.todaysSale ?? 0)"
                                         self.productCountLbl.text="\(data.productsCount ?? 0)"
                                         self.ordersCompletedLbl.text="\(data.ordersCompleted ?? 0)"
                                        self.ordersPendingLbl.text="\(data.ordersPending ?? 0)"
                                         self.dashBoarddata.append(data)
                                        self.ordersCancelledLbl.text="\(data.ordersCancel ?? 0)"
                                        self.buyersNewLbl.text="\(data.buyersNew ?? 0)"
                                         self.buyersActiveLbl.text="\(data.buyersActive ?? 0)"
                                         self.buyersInactiveLbl.text="\(data.buyersInactive ?? 0)"
                                        self.productsNewLbl.text="\(data.productsNew ?? 0)"
                                          self.productsTopSellLbl.text="\(data.productsTopSale ?? 0)"
                                          self.productsLessSaleLbl.text="\(data.productsLessSale ?? 0)"
                                                                                self.dashBoarddata.append(data)
                                     }
                                 
                                 }
                            
                             }
        
        
        
        
        
        
    }

}

