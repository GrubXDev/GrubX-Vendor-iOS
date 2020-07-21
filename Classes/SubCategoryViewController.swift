//
//  SubCategoryViewController.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 19/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import KRProgressHUD
import Kingfisher
class SubCategoryViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var nameofcategory=String()
    var idofcategory=String()
      private let spacing:CGFloat = 16.0
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryData.count
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.isNavigationBarHidden = false
                         
                          self.navigationItem.title = "Select SubCategory"
                          self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
                          
                          self.navigationController?.navigationBar.tintColor = .white
                          self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                          self.navigationController?.navigationBar.isTranslucent = false
                          self.navigationController?.view.backgroundColor = .white
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell=subCategoryCollView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SubCategoriesCollectionViewCell
              // cell.layer.borderColor = UIColor.black.cgColor
              // cell.layer.borderWidth = 1
              // cell.layer.cornerRadius = 10
               
             let conn="/"
                             
                             //print(prodData[indexPath.row].imgUrl1!)
                             //print(path!+conn+prodData[indexPath.row].imgUrl1!)
               
               if let imageUrl = categoryData[indexPath.row].imgUrl{
                let url = URL(string: self.image_path+conn+imageUrl)
               //let url = URL(string: path!+conn+categoryData[indexPath.row].imgUrl!)!
               cell.imgView.kf.setImage(with: url)
               cell.nameLbl.text=categoryData[indexPath.row].name
                cell.countLbl.text=categoryData[indexPath.row].totalproducts + " products"
               }
               
               return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "VendorProductsViewController") as! VendorProductsViewController
               vc.id=categoryData[indexPath.row].id
        vc.catid=self.id
        vc.categoryname=self.nameofcategory
        vc.categoryid=self.idofcategory
        vc.subcategoryid=categoryData[indexPath.row].id
        vc.subcategoryname=self.categoryData[indexPath.row].name
        
                         navigationController?.pushViewController(vc, animated: true)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
              let numberOfItemsPerRow:CGFloat = 2
              let spacingBetweenCells:CGFloat = 16
              
              let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
              
              if let collection = self.subCategoryCollView{
                  let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                  return CGSize(width: width, height: width+20)
              }else{
                  return CGSize(width: 0, height: 0)
              }
          }

    var image_path = String()
       var imageurl = String()
 var id:String?
    @IBOutlet weak var subCategoryCollView: UICollectionView!
      var categoryData:[Subcategoryvendorllist] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        if SingleToneClass.shared.isInternetAvailable()==false{
                                 SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message:  "Please check your internet connection") {
                                     
                                 }
                             }
        subcategory()
//print(id)
        // Do any additional setup after loading the view.
    }

    
    func subcategory(){
       // usersubcategories/userid/categoty_id
         let login = UserDefaults.standard.object(forKey: "LoginID") as! Int
        let tokenAndDeviceType="usersubcategories/\(String(login))/\(self.id!)"
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
                                                   var FinalData = Subcategoryvendorllist()
                                                   FinalData.name = get["name"].string!
                                                    FinalData.imgUrl = get["img_url"].string!
                                                    //print( FinalData.imgUrl)
                                                    self.imageurl = FinalData.imgUrl
                                                    print(self.imageurl)
                                                    FinalData.id = get["id"].string!
                                                    FinalData.totalproducts = get["totalproducts"].string!
                                                   self.categoryData.append(FinalData)
                
                                                }
                                                print(self.categoryData)
                                                    
                                                self.subCategoryCollView.reloadData()
                
                                                                }
                                                            }
                                
                                                        }
           
                      }
           
       }

}
