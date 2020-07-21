//
//  VendorProductsViewController.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 19/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import KRProgressHUD
var selectedIndex=0
class VendorProductsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var subcategoryname=String()
    var categoryname=String()
    var categoryid=String()
    var subcategoryid=String()
    var catid:String?
    var image_path = String()
          var imageurl = String()
    var categoryData:[VendorProductsModel0] = []
    var id:String?
     private let spacing:CGFloat = 16.0
    @IBOutlet weak var sideMenuBtn: UIBarButtonItem!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=vendorProductsCollView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! VendorProductsCollectionViewCell
        let conn="/"
                                        
                                        //print(prodData[indexPath.row].imgUrl1!)
                                        //print(path!+conn+prodData[indexPath.row].imgUrl1!)
                          
                          if let imageUrl = categoryData[indexPath.row].imgUrl1{
                           let url = URL(string: self.image_path+conn+imageUrl)
                          //print(url)
                           cell.imgView.kf.setImage(with: url)
                            cell.nameLbl.text=categoryData[indexPath.row].name
                            cell.countLbl.text=categoryData[indexPath.row].stock
                            cell.editBtn.addTarget(self, action: #selector(self.editTapped(_:)), for: .touchUpInside)
                            cell.editBtn.tag=indexPath.row
                           // print(cell.editBtn.tag)
        }
        return cell
    }
    @IBAction func editTapped(_ sender:UIButton){
        selectedIndex=sender.tag
        print(selectedIndex)
       let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                               let gotoOTP = storyBoard.instantiateViewController(withIdentifier: "AddProductViewController") as! AddProductViewController
        //print(categoryData[selectedIndex].name)
        gotoOTP.datafromvc=categoryData
        gotoOTP.selecteddata=sender.tag
        gotoOTP.path=self.image_path
        gotoOTP.secondary="alternate"
        gotoOTP.catvalue=id!
        gotoOTP.subcatValue=catid!
        gotoOTP.categorydatafinal=self.categoryname
        gotoOTP.subcategorydatafinal=self.subcategoryname
        gotoOTP.finalcategoryid=self.categoryid
        gotoOTP.finalsubcategoryid=self.subcategoryid
        //gotoOTP.finalProductId=
                                self.navigationController?.pushViewController(gotoOTP, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           let numberOfItemsPerRow:CGFloat = 2
           let spacingBetweenCells:CGFloat = 5
           
           let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
           
           if let collection = self.vendorProductsCollView{
               let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
               return CGSize(width: width, height: width+30)
           }else{
               return CGSize(width: 0, height: 0)
           }
        
        
        
        
       }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    
    }


    @IBOutlet weak var vendorProductsCollView: UICollectionView!
    var product = String()
       
       override func viewWillAppear(_ animated: Bool) {
                 
           self.navigationController?.isNavigationBarHidden = false
                     
                      self.navigationItem.title = "Select Product"
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
           
            self.navigationController?.isNavigationBarHidden = false
            self.tabBarController?.tabBar.isHidden = false
         //   scrollViewDidEndDecelerating(collection)
        // self.navigationItem.title = "Dashboard"
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
            self.navigationController?.navigationBar.tintColor = .white
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.view.backgroundColor = .white
               
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for:[])


             
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        if SingleToneClass.shared.isInternetAvailable()==false{
                                 SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message:  "Please check your internet connection") {
                                     
                                 }
                             }
subcategory()
        print(categoryid)
        print(subcategoryid)
       // print(id)
        //print(catid)
        // Do any additional setup after loading the view.
    }
    

      func subcategory(){
       // usersubcategoryproducts/100/70
           // usersubcategories/userid/categoty_id
             let login = UserDefaults.standard.object(forKey: "LoginID") as! Int
            let tokenAndDeviceType="usersubcategoryproducts/\(String(login))/\(self.id!)"
                   KRProgressHUD.show(withMessage: "please wait") {

                            }
    Service.shared.GETService2(extraParam: API.subcategoriesnew + tokenAndDeviceType) { (response) -> (Void) in
                    DispatchQueue.global(qos: .background).async {
                                       DispatchQueue.main.async {
                                       KRProgressHUD.dismiss()
                                                    guard let SuccessGet = response.dictionary else{return}
                                        guard let data = SuccessGet["data"]?.dictionary else{return}
                                        
                                        self.image_path = (data["path"]?.string)!
                                         print(self.image_path)
                                                       if  let allSuccess = data["0"]!.array {
                                                       for get in allSuccess{
                                                       var FinalData = VendorProductsModel0()
                                                       FinalData.name = get["name"].string!
                                                        //FinalData.imgUrl1 = get["img_url1"].string!
                                                        //print( FinalData.imgUrl)
                                                       
                                                        print(self.imageurl)
                                                        FinalData.id = get["id"].string!
                                                        FinalData.stock=get["stock"].string!
                                                        FinalData.price=get["price"].string!
                                                        FinalData.quantity=get["quantity"].string!
                                                        FinalData.units=get["units"].string!
                                                        FinalData.offerPrice=get["offer_price"].string!
                                                        FinalData.imgUrl1=get["img_url1"].string!
                                                         FinalData.imgUrl2=get["img_url2"].string!
                                                         FinalData.imgUrl3=get["img_url3"].string!
                                                        FinalData.descriptionField=get["description"].string!
                                                       self.categoryData.append(FinalData)
                    
                                                    }
                                                    print(self.categoryData)
                                                        
                                                    self.vendorProductsCollView.reloadData()
                    
                                                                    }
                                                                }
                                    
                                                            }
               
                          }
               
           }
    
    

}
