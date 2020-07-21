//
//  BuyerDetailsViewController.swift
//  Grub X Vender
//
//  Created by Shreyash Shriyam on 02/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import KRProgressHUD
import Kingfisher
class BuyerDetailsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
var id=Int()
     let profileImages = UserDefaults.standard.object(forKey: "profileImage") as? String
    var buyersData:[BuyerDetailedContent] = []
    @IBOutlet weak var collection2: UICollectionView!
    
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var mobilenoLbl: UILabel!
    
    @IBOutlet weak var businessNameLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var OwnerNameLbl: UILabel!
    
   override func viewWillAppear(_ animated: Bool) {
       
        
       
        let imgBack = UIImage(named: "Grub-X_0054_left-arrow")
                              
        navigationController?.navigationBar.backIndicatorImage = imgBack
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = imgBack
                              
        navigationItem.leftItemsSupplementBackButton = true
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
           self.navigationController?.isNavigationBarHidden = false
           self.tabBarController?.tabBar.isHidden = true
           self.navigationItem.title = "Buyer Details"
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
        print(id)
        if SingleToneClass.shared.isInternetAvailable()==false{
                                 SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message:  "Please check your internet connection") {
                                     
                                 }
                             }
        
        

    }
    

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          
               return 5
        
             
       
    }
         
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
            
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BuyerDetailsDataCollectionViewCell
                    
               
        
        cell.cellView.layer.cornerRadius = 10
          
               
        
        return cell
           
        
    }
       
    func api(){
           
           let accessToken = UserDefaults.standard.object(forKey: "Token") as! String
                          let header = ["Accept" : "application/json","Authorization" : "Bearer \(accessToken)"]
           var conn="/\(self.id)"
                   Alamofire.request(API.allBuyers + conn,headers: header).responseObject { (response: DataResponse<BuyerDetailedData>) in
           KRProgressHUD.dismiss()
                         let initialresponse = response.result.value
                         
                       if let resultdata = initialresponse?.data {
                             for data in resultdata {
                                 self.buyersData.append(data)
                               DispatchQueue.main.async{
                               self.OwnerNameLbl.text=data.name
                               self.businessNameLbl.text=data.businessName
                               self.mobilenoLbl.text=data.phone
                               self.addressLbl.text=data.address
                               self.emailLbl.text=data.email
                                let conn="/"
                                              
                                              //print(prodData[indexPath.row].imgUrl1!)
                                              //print(path!+conn+prodData[indexPath.row].imgUrl1!)
                                
                                if let imageUrl = data.imgUrl{
                                 let url = URL(string: imagelink+imageUrl)
                                //print(url)
                                 self.imgView.kf.setImage(with: url)
                                }
                            
                               }
                             }
                             
                         }
                     }
           
           
           
           
           
       }


}
