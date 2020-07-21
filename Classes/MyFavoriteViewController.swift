//
//  MyFavoriteViewController.swift
//  Grub X Vender
//
//  Created by Shreyash Shriyam on 02/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import UIKit
import Alamofire
import AlamofireObjectMapper
import KRProgressHUD
import Toast_Swift
var selectedIndexes=0
var image="http://grubx.srimaruthienterprises.in/storage/cover_images/"
class MyFavoriteViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
     private let spacing:CGFloat = 8.0
var MyFavourites:[MyFavouritesData] = []
    @IBOutlet weak var collection: UICollectionView!
    
    
    override func viewWillAppear(_ animated: Bool) {
     
         self.navigationController?.isNavigationBarHidden = false
        
        
         self.navigationItem.title = "My Favourites"
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
        // Do any additional setup after loading the view.
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                 return MyFavourites.count
           
         }
         
         func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
             
        
        
             
               let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyFavoriteCollectionViewCell
                    
                            //  if let imageUrl = MyFavourites[indexPath.row].imgUrl{
                                             // let url = URL(string: image+imageUrl)
                                             //cell.imgView.kf.setImage(with: url)
                                 var trimmedStr = String()
                                  var baseUrlStr = String()
                                  var imgUrlStr = MyFavourites[indexPath.row].imgUrl as? String
                                  print(imgUrlStr)
                                  
                                  if (imgUrlStr?.contains(" "))!{
                                      
                                  let  trimmedString = imgUrlStr?.replacingOccurrences(of: " ", with: "%20")
                                      
                                      trimmedStr = trimmedString!
                                      baseUrlStr = bannerlink + (trimmedStr ?? "")
                                      
                                  print("trimmedStringtrimmedString",trimmedString)
                                  }else{
                                      baseUrlStr = bannerlink + (imgUrlStr ?? "")
                                  }
                                  
                                  let  url = URL.init(string: baseUrlStr)
                                  print("URL===========",url )
                                 
                                  cell.imgView.contentMode = .scaleAspectFit
                                  cell.imgView.sd_setImage(with: url, placeholderImage:nil, options: .lowPriority, progress: nil
                                                         , completed: { (image, error, cacheType, url) in
                                              if image != nil  {
                                                 cell.imgView.image = image
                                                  cell.imgView.contentMode = .scaleAspectFit
                                                  }else{
                                                  cell.imgView.image = UIImage.init(named:"budweisier_1584791337.jpg")
                                                              
                                                          }
                                  })

                                 cell.cellView.layer.cornerRadius = 10
                                 cell.contactBtn.layer.cornerRadius = 10
                              cell.nameLbl.text=MyFavourites[indexPath.row].name
                              cell.nameLbl2.text=MyFavourites[indexPath.row].name
                                cell.contactBtn.addTarget(self, action: #selector(self.editTapped(_:)), for: .touchUpInside)
                                           cell.contactBtn.tag=Int(MyFavourites[indexPath.row].id!)!
                            //  }
               
               return cell
           
         }
       @IBAction func editTapped(_ sender:UIButton){
              selectedIndexes=sender.tag
             let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                                     let gotoOTP = storyBoard.instantiateViewController(withIdentifier: "BuyerDetailsViewController") as! BuyerDetailsViewController
              gotoOTP.id=sender.tag
              
                                      self.navigationController?.pushViewController(gotoOTP, animated: true)
          }
          
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                 let numberOfItemsPerRow:CGFloat = 3
                 let spacingBetweenCells:CGFloat = 2
                
                 if let collection = self.collection{
                     let width = (collection.bounds.width - 2)/numberOfItemsPerRow
                     return CGSize(width: width-5, height: width+40)
                 }else{
                     return CGSize(width: 0, height: 0)
                 }
              
             }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 10
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 1
       }
     func api(){
           
           let userid = UserDefaults.standard.object(forKey: "LoginID") as! Int
                      let accessToken = UserDefaults.standard.object(forKey: "Token") as! String
                              let header = ["Accept" : "application/json","Authorization" : "Bearer \(accessToken)"]
                        
              var conn=String(userid)
               print(conn)
                       Alamofire.request(API.myFavouritesapi + conn,headers: header).responseObject { (response: DataResponse<MyFavouritesModel>) in
               KRProgressHUD.dismiss()
                             let initialresponse = response.result.value
                             
                           if let resultdata = initialresponse?.data {
                                 for data in resultdata {
                                     self.MyFavourites.append(data)
                                 }
                              // print(self.CatalogueProducts)
                                 self.collection.reloadData()
                             }
                        
                         }
               
       }

}
