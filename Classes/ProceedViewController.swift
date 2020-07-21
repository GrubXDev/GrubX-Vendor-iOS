//
//  ProceedViewController.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 12/03/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class ProceedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var str=String()
    var image:String?
    @IBOutlet weak var offerPrice: UITextField!
    @IBOutlet weak var originalPriceTF: UITextField!
    @IBOutlet weak var miniCatalogueNameTF: UITextField!
    @IBOutlet weak var thirdView: UIView!
    var imageUrl:String?
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var uploadImgBtn: UIButton!
    @IBOutlet weak var fourthView: UIView!
    @IBOutlet weak var secondView: UIView!
    var finalIdsArray=[String]()
    var priceArrayList=[String]()
    var nameArray=[String]()
    var countArray=[String]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    @IBOutlet weak var firstView: UIView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProceedTableViewCell
        cell.nameLbl.text=nameArray[indexPath.row]
        cell.quantityTF.text=countArray[indexPath.row]
        cell.priceLbl.text=priceArrayList[indexPath.row]
        cell.unitsLbl.text="ltr"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgView.layer.cornerRadius =  self.imgView.bounds.size.width / 2
               self.imgView.clipsToBounds = true
        firstView.layer.masksToBounds = false
                                          
        firstView.layer.shadowColor = UIColor.lightGray.cgColor
                                          
        firstView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
                                          
        firstView.layer.shadowOpacity = 0.5
        
        //firstView.layer.cornerRadius=10
        
        secondView.layer.masksToBounds = false
                                                 
        secondView.layer.shadowColor = UIColor.lightGray.cgColor
                                                 
                secondView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
                                                 
                      secondView.layer.shadowOpacity = 0.5
                      //secondView.layer.cornerRadius=10
      
        thirdView.layer.masksToBounds = false
                                   
        thirdView.layer.shadowColor = UIColor.lightGray.cgColor
                                   
        thirdView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
                                   
        thirdView.layer.shadowOpacity = 0.5
        //thirdView.layer.cornerRadius=10
//        fourthView.layer.masksToBounds = false
//                                         
//              fourthView.layer.shadowColor = UIColor.lightGray.cgColor
//                                         
//              fourthView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
//                                         
//              fourthView.layer.shadowOpacity = 0.5
             // fourthView.layer.cornerR
        
    }
    override func viewWillAppear(_ animated: Bool) {
                      
               
             
           self.navigationController?.isNavigationBarHidden = false
       
              
           self.navigationItem.title = " Catalogue"
           self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
           self.navigationController?.navigationBar.tintColor = .white
           self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
           self.navigationController?.navigationBar.isTranslucent = false
           self.navigationController?.view.backgroundColor = .white
                    
          


            
          }
   func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           
           let tempImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
           self.imgView.image = tempImage
           self.dismiss(animated:true) {
               self.uploadImage()
           }
           
       }
       
       
       func uploadImage() {
           
        self.imgView.alpha = 0.5
           
        let imageData:NSData = self.imgView.image!.jpeg(.medium)! as NSData
           let imageStr = imageData.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
           
        self.imageUrl  = imageStr
       // print(self.imageUrl)
         
       }
    
    
    @IBAction func onUploadImgTap(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func proceedToTap(_ sender: Any) {
        
        
        if miniCatalogueNameTF.text?.count==0 {
                                                      
                       SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter MiniCatalogue NAme") {
                           self.miniCatalogueNameTF.becomeFirstResponder()
                                                      }
                                                      
                                                      
                           } else if originalPriceTF.text?.count==0 {
                                                      
                           SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter originalprice") {
                           self.originalPriceTF.becomeFirstResponder()
                                                      }
                                                      
                                                  }
              else if offerPrice.text?.count==0 {
                                         
              SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter Offerprice") {
              self.offerPrice.becomeFirstResponder()
                                         }
                                         
                                     }
                else{
              
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)

        
          let vc = storyBoard.instantiateViewController(withIdentifier: "PlaceOrderBuyersViewController") as! PlaceOrderBuyersViewController
        vc.finalProductsidsArray=self.finalIdsArray
                    vc.finalProductsCountArray=self.countArray
      //  print(self.finalIdsArray)
      //  print(self.countArray)
                vc.id="specialcatalogue"
                vc.name=self.miniCatalogueNameTF.text!
                vc.offerPrice=self.offerPrice.text!
                vc.price=self.originalPriceTF.text!
               // print(imageUrl)
        vc.imageUrl=imageUrl!
           self.navigationController?.pushViewController(vc, animated: true)
        
    }
    }

}
