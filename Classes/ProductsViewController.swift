//
//  ProductsViewController.swift
//  Grub X Vender
//
//  Created by MAD-MAC on 31/01/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import KRProgressHUD
import Kingfisher
import AlamofireObjectMapper
import Alamofire
import SDWebImage

class ProductsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   
    
    var editidArray=[Int]()
    var editName=[String]()
  
    
    @IBOutlet weak var combinationsBtn: UIButton!
    @IBOutlet weak var productsBtn: UIButton!
    @IBOutlet weak var combinationsView: UIView!
    @IBOutlet weak var productsView: UIView!
   
    @IBOutlet weak var collection: UICollectionView!
    
    @IBOutlet weak var sideMenuBtn: UIBarButtonItem!
    
   
    var product = String()
    
    
    var subcategoryname=String()
    var categoryname=String()
    var categoryid=String()
    var subcategoryid=String()
    var catid:String?
    var image_path = String()
    var imageurl = String()
    var categoryData:[VendorProductsModel0] = []
    var id:String?
    var CatalogueProducts:[CatalogueProductDetailData] = []
       //var image_path = String()
       //var imageurl = String()
     
    
    private let spacing:CGFloat = 8.0
    
   
    var mini=String()
    var miniCatalogueData:[MiniCatalogueData] = []
      
       
    
    let grayColour = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1.0)
    let redColour = UIColor(red: 203.0/255.0, green: 8.0/255.0, blue: 22.0/255.0, alpha: 1.0)
    
    
    
    override func viewWillAppear(_ animated: Bool) {
              
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Products"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
                   
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = .white
       
        
        
        if product == "1" {
        
            self.sideMenuBtn.isEnabled = false
            self.sideMenuBtn.tintColor = UIColor.clear
            let imgBack = UIImage(named: "Grub-X_0054_left-arrow")
                       
            navigationController?.navigationBar.backIndicatorImage = imgBack
            navigationController?.navigationBar.backIndicatorTransitionMaskImage = imgBack
                       
            navigationItem.leftItemsSupplementBackButton = true
            navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
                       
          
        }
        
//         self.navigationController?.isNavigationBarHidden = false
//         self.tabBarController?.tabBar.isHidden = false
//      //   scrollViewDidEndDecelerating(collection)
//     // self.navigationItem.title = "Dashboard"
//         self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
//         self.navigationController?.navigationBar.tintColor = .white
//         self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//         self.navigationController?.navigationBar.isTranslucent = false
//         self.navigationController?.view.backgroundColor = .white
//
//     UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for:[])


          
     }
    
    
    override func viewDidLoad() {
         super.viewDidLoad()
         KRProgressHUD.show()
         api()
        edit()
        combinationsView.backgroundColor = grayColour
        combinationsBtn.setTitleColor(.black, for: .normal)
        
         if SingleToneClass.shared.isInternetAvailable()==false{
                                  
             SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message:  "Please check your internet connection") {
                                      
                                 
             }
                              
         }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
             
    
  
        let numberOfItemsPerRow:CGFloat = 3
   
        let spacingBetweenCells:CGFloat = 2
              
    // let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
              
    
   
        if let collection = self.collection{
                  
       
            let width = (collection.bounds.width - 2)/numberOfItemsPerRow
                
       
            return CGSize(width: width, height: width+90)
             
  
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        if mini=="2"{
          
            return miniCatalogueData.count
       
        }else{
       
            return CatalogueProducts.count
        }
    
    }
       
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if mini=="2"{
           
            let cell=collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductsCollectionViewCell
                   
                 
           // if let imageUrl = miniCatalogueData[indexPath.row].imgUrl1{
                          
              //  let url = URL(string: imagepath+imageUrl)
                         //let url = URL(string: path!+conn+categoryData[indexPath.row].imgUrl!)!
                        
               // cell.cellImage.kf.setImage(with: url)
                     
                   var trimmedStr = String()
                    var baseUrlStr = String()
                    var imgUrlStr = miniCatalogueData[indexPath.row].imgUrl1 as? String
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
                   /* cell.imgView.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                        if (image != nil){
                            
                            cell.imgView.image = image
                           cell.imgView.contentMode = .scaleAspectFit
                        }else{
                            cell.imgView.image = UIImage.init(named:"budweisier_1584791337.jpg")
                            
                        }
                    }*/
                    cell.cellImage.contentMode = .scaleAspectFit
                    cell.cellImage.sd_setImage(with: url, placeholderImage:nil, options: .lowPriority, progress: nil
                                           , completed: { (image, error, cacheType, url) in
                                if image != nil  {
                                   cell.cellImage.image = image
                                    cell.cellImage.contentMode = .scaleAspectFit
                                    }else{
                                    cell.cellImage.image = UIImage.init(named:"budweisier_1584791337.jpg")
                                                
                                            }
                    })
                  
                cell.productName.text=miniCatalogueData[indexPath.row].name
                  
                cell.productCost.text=miniCatalogueData[indexPath.row].quantity
                   
                cell.editBtn.addTarget(self, action: #selector(self.editTappedcombo(_:)), for: .touchUpInside)
                    
                  
           // }
                   
                  
            return cell
        }else{
       
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductsCollectionViewCell
                   
      
           // if let imageUrl = CatalogueProducts[indexPath.row].imgUrl1{
              
               // let url = URL(string: imagepath+imageUrl)
              //let url = URL(string: path!+conn+categoryData[indexPath.row].imgUrl!)!
             
               // cell.cellImage.kf.setImage(with: url)
             var trimmedStr = String()
                              var baseUrlStr = String()
                              var imgUrlStr = CatalogueProducts[indexPath.row].imgUrl1 as? String
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
                             /* cell.imgView.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                                  if (image != nil){
                                      
                                      cell.imgView.image = image
                                     cell.imgView.contentMode = .scaleAspectFit
                                  }else{
                                      cell.imgView.image = UIImage.init(named:"budweisier_1584791337.jpg")
                                      
                                  }
                              }*/
                              cell.cellImage.contentMode = .scaleAspectFit
                              cell.cellImage.sd_setImage(with: url, placeholderImage:nil, options: .lowPriority, progress: nil
                                                     , completed: { (image, error, cacheType, url) in
                                          if image != nil  {
                                             cell.cellImage.image = image
                                              cell.cellImage.contentMode = .scaleAspectFit
                                              }else{
                                              cell.cellImage.image = UIImage.init(named:"budweisier_1584791337.jpg")
                                                          
                                                      }
                              })
                cell.productName.text=CatalogueProducts[indexPath.row].name
             
                cell.productCost.text=CatalogueProducts[indexPath.row].price
      
                cell.editBtn.addTarget(self, action: #selector(self.editTapped(_:)), for: .touchUpInside)
                                   cell.editBtn.tag=indexPath.row
                 // cell.countLabel.text=CatalogueProducts[indexPath.row].price
             // }
            
       
            return cell
       
        }
      
    }
    
    
    @IBAction func editTapped(_ sender:UIButton){
        
          
        selectedIndex=sender.tag
        print(selectedIndex)
           print(selectedIndex)
         
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                                
        let gotoOTP = storyBoard.instantiateViewController(withIdentifier: "AddProductViewController") as! AddProductViewController
        gotoOTP.finalcategoryid=CatalogueProducts[selectedIndex].id!
        gotoOTP.finalProductId=CatalogueProducts[selectedIndex].categoriesId!
        gotoOTP.secondary="products"
        print(self.editidArray)
        gotoOTP.editidArray=self.editidArray
         gotoOTP.editName=self.editName
        gotoOTP.datafromVC1=[CatalogueProducts[selectedIndex]]

                                
        self.navigationController?.pushViewController(gotoOTP, animated: true)
      
    }
   
    @IBAction func editTappedcombo(_ sender:UIButton){
        print("here")

       
         }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        

    }
    
    
    func edit(){
                 

                       
             var token =  UserDefaults.standard.object(forKey: "Token") as! String
                               
             let header = ["Accept" : "application/json","Authorization" : "Bearer \(token)"]
             Alamofire.request(API.categories,headers: header).responseObject { (response: DataResponse<Category>) in
                 //print(response)
         
                 KRProgressHUD.dismiss()
                      
                 let initialresponse = response.result.value
                      // print(initialresponse)
                     
                 if let resultdata = initialresponse?.data {
                          
                     for data in resultdata {

                        // self.categoriesName.append(data.name ?? "novalue")
                         self.editidArray.append(data.id ?? 0)
                            
                        self.editName.append(data.name ?? "no")
                           
                        // self.dropdata()
                            
                          
                     }
                  
                    print(self.editidArray)
                    print(self.editName)
                 }
                  
             }
          
            
         }
    

    

   func api(){
    CatalogueProducts.removeAll()
       
    let userid = UserDefaults.standard.object(forKey: "LoginID") as! Int
             
    let accessToken = UserDefaults.standard.object(forKey: "Token") as! String
                    
    let header = ["Accept" : "application/json","Authorization" : "Bearer \(accessToken)"]
                
      var conn=String(userid)
      var extraconn="/0/0"
       print(conn)
              
    Alamofire.request(API.catalogueProducts + conn + extraconn,headers: header).responseObject { (response: DataResponse<CatalogueProductDetail>) in
      
        KRProgressHUD.dismiss()
                   
        let initialresponse = response.result.value
                     
                  
        if let resultdata = initialresponse?.data {
                       
            for data in resultdata {
                            
                self.CatalogueProducts.append(data)
                         
            }
                       
            print(self.CatalogueProducts)
                        
            self.collection.reloadData()
                     
        }
                
    }
       
       
       
       
       
       
   }
    
      
    @IBAction func onProductsBtnTap(_ sender: Any) {
        mini="0"
               KRProgressHUD.show()
               miniCatalogueData.removeAll()
               api()
        
         self.productsView.backgroundColor = UIColor.white
        productsBtn.setTitleColor(redColour, for: [])
         
        // comboBtn.backgroundColor=UIColor.lightGray
        self.combinationsView.backgroundColor = UIColor.lightGray
        combinationsBtn.setTitleColor(grayColour, for: [])
         
       
        
    }
    
    @IBAction func onCombinationsBtnTap(_ sender: Any) {
      // KRProgressHUD.show()
       // CatalogueProducts.removeAll()
        //api2()
        
        self.combinationsView.backgroundColor = UIColor.white
        combinationsBtn.setTitleColor(redColour, for: [])
           
        self.productsView.backgroundColor=UIColor.lightGray
        productsBtn.setTitleColor(grayColour, for: [])
         
            
             //self.productsView.backgroundColor = grayColour
        
        
        self.mini="2"
        miniCatalogueData.removeAll()
        KRProgressHUD.show()
        api2()
        //collection.reloadData()
        
    }
    
    
    
    func api2(){
        
        CatalogueProducts.removeAll()
        miniCatalogueData.removeAll()
          mini="2"
        let userid = UserDefaults.standard.object(forKey: "LoginID") as! Int
              
          
        let accessToken = UserDefaults.standard.object(forKey: "Token") as! String
                            
          
        let header = ["Accept" : "application/json","Authorization" : "Bearer \(accessToken)"]
                        
          
        var conn="/\(userid)/\(mini)"
                     
          
        Alamofire.request(API.miniCatalogue + conn,headers: header).responseObject { (response: DataResponse<MiniCatalogueModel>) in
            
            KRProgressHUD.dismiss()
             
            let initialresponse = response.result.value
            
            if let resultdata = initialresponse?.data {
                   print(resultdata)
                  
                for data in resultdata {
                   
                    self.miniCatalogueData.append(data)
                 
                }
               
                self.collection.reloadData()
             
            }
        
        }
     
       }
    
       
    @IBAction func onFilterTap(_ sender: Any) {

//        let obj = self.storyboard?.instantiateViewController(withIdentifier: "FilterViewController")as! FilterViewController
//
//        let transition:CATransition = CATransition()
//        transition.duration = 0.3
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromLeft
//        self.navigationController!.view.layer.add(transition, forKey: kCATransition)
//
//        self.navigationController?.pushViewController(obj, animated: true)
        
        
        let POPUPVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FilterViewController") as! FilterViewController
                            
        self.addChild(POPUPVC)
        POPUPVC.view.frame = CGRect.init(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
                      
        self.view.addSubview(POPUPVC.view)
        POPUPVC.didMove(toParent: self)
        
        
    }
}


