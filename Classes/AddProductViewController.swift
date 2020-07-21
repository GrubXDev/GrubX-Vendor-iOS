//
//  AddProductViewController.swift
//  Grub X Vender
//
//  Created by MAD-MAC on 31/01/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import DropDown
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper
import KRProgressHUD
import Photos
import MobileCoreServices
import Kingfisher


class AddProductViewController: UIViewController,UIImagePickerControllerDelegate ,UINavigationControllerDelegate,UITextViewDelegate,UITextFieldDelegate {
    var pic="http://grubx.srimaruthienterprises.in/storage/cover_images/"
    @IBOutlet weak var sideMenuBtn: UIBarButtonItem!
    var datafromVC1:[CatalogueProductDetailData] = []
    var succesStatus:Int!
          var messageStatus:String!
          var errorStatus:String!
    @IBOutlet weak var existingBtn: DLRadioButton!
    @IBOutlet weak var customBtn: DLRadioButton!
    @IBOutlet weak var activeBtn: DLRadioButton!
    
    
    @IBOutlet weak var subCategoryBtn: UIButton!
    @IBOutlet weak var productImg1: UIButton!
    @IBOutlet weak var productImg2: UIButton!
    @IBOutlet weak var productImg3: UIButton!
    @IBOutlet weak var dropDownBtn: UIButton!
    
    @IBOutlet weak var quantityTF: UITextField!
    @IBOutlet weak var stockTF: UITextField!
    @IBOutlet weak var offerPriceTf: UITextField!
    @IBOutlet weak var originalPriceTF: UITextField!
    @IBOutlet weak var productNameTF: UITextField!
    
    @IBOutlet weak var productDescriptionTV: UITextView!

    @IBOutlet weak var selectSubcategoryLbl: UILabel!
    @IBOutlet weak var selectCategoryLbl: UILabel!
    
    @IBOutlet weak var productApperanceLblHeight: NSLayoutConstraint!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var view8: UIView!
    @IBOutlet weak var view9: UIView!
    var editName=[String]()
    
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var selectCategoryTF: UITextField!
    
    @IBOutlet weak var subCategoryTF: UITextField!
    
    @IBOutlet weak var productUnitsTF: UITextField!
    
    @IBOutlet weak var cameraStackView: UIStackView!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var radioBtnStackView: UIStackView!
   
    @IBOutlet weak var viewheight: NSLayoutConstraint!
    @IBOutlet weak var radioBtnHeight: NSLayoutConstraint!
    
    var categorydatafinal=String()
    var subcategorydatafinal=String()
    var catvalue=String()
    var subcatValue=String()
    var path:String?
    var selecteddata=0
    var secondary=String()
    
    var datafromvc:[VendorProductsModel0] = []
  //var id:String?
    
    let picker1 = UIImagePickerController()
    let picker2 = UIImagePickerController()
    let picker3 = UIImagePickerController()
    
    var finalProductId=String()
    var finalcategoryid=String()
    var finalsubcategoryid=String()
    //var body = Data()
//
//    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
//    let filePath = "\(paths[0])/MyImageName.jpg" // Save image. UIImageJPEGRepresentation(image, 0.90)?.writeToFile(filePath, atomically: true)
    
    var imgurl1:Data?
    //var imagepick1:UIImage!
    var imgurl2:Data?
    var imgurl3:Data?
    
    
    
  //  var body = NSData()
    
    
    var id:Int!
    var subId:Int!
    var editidArray=[Int]()
    var categoriesName = [String]()
    var subcategoriesNameArr = [String]()
    var categoriesid = [Int]()
    var logoutDropDown = DropDown()
    var subDropdown = DropDown()
    var dropdowncustom = DropDown.appearance()
    var subdropdowncustom = DropDown.appearance()
    var imgarray:[String] = []
    

    lazy var dropDown: [DropDown] = {
            
        return [self.logoutDropDown]
          
    }()
      
      
    lazy var subdropDown: [DropDown] = {
         
        return [self.subDropdown]
     
    }()
    
    
    
    var productUnitsArray = ["-Select-","ML","KG","GMS","LTRS","UNITS"]
    var catData:[Data] = []
    var transperentView = UIView()
    
    @IBAction func productImg3(_ sender: Any) {
     // let picker3 = UIImagePickerController()
        picker3.delegate = self
        picker3.sourceType = .photoLibrary
        present(picker3, animated: true, completion: nil)
        
    }
    @IBAction func productImg2(_ sender: Any) {
       //let picker2 = UIImagePickerController()
        picker2.delegate = self
        picker2.sourceType = .photoLibrary
        present(picker2, animated: true, completion: nil)
    }
    @IBAction func productImg1Tap(_ sender: Any) {
      // let picker1 = UIImagePickerController()
        picker1.delegate = self
        picker1.sourceType = .photoLibrary
        present(picker1, animated: true, completion: nil)
    }
    
  
    
   
    
  
    
    @IBAction func activeTap(_ sender: Any) {
    }
    
    @IBAction func inactiveTap(_ sender: Any) {
    }
    
   
    
    @IBAction func grubXBtn(_ sender: Any) {
        self.productNameLbl.isHidden = true
        self.cameraStackView.isHidden = true
             viewHeight.constant = 60
        productApperanceLblHeight.constant = 0
    
    }
    
     
   
    @IBAction func addCustomBtn(_ sender: Any) {
        self.productNameLbl.isHidden = false
        self.cameraStackView.isHidden = false
         viewHeight.constant =  160
         productApperanceLblHeight.constant = 30
    }
    
    
    
    
    @IBAction func subcategoryTap(_ sender: Any) {
        
        
        if selectCategoryTF.text == "" {
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message: "Please Select Categories") {
                
            }
        }else{
            self.subCategoryBtn.isUserInteractionEnabled=true
       
            subcategory()
        }
      
     
    }
    
    
    
  
    
    
  
    
    @IBAction func subCategoryTF(_ sender: UITextField) {
        
        subCategoryTF.resignFirstResponder()
        
        if selectCategoryTF.text == "" {
                  
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message: "Please Select Categories") {
                       
                 
            }
               
        }else{
                 
            self.subCategoryBtn.isUserInteractionEnabled=true
            subcategory()
             
        }
        
    }
    
  
    @IBAction func productUnitsTF(_ sender: UITextField) {
        productUnitsTF.resignFirstResponder()
        productUnitsDropDown()
        
        
    }
    
    
    @IBAction func productUnitsBtn(_ sender: Any) {
        productUnitsDropDown ()
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
               
        if secondary=="products"{
            
            self.radioBtnStackView.isHidden = true
            self.view2.isHidden = true
            self.view3.isHidden = true
            self.view8.isHidden = true
            self.cancelBtn.isHidden = true
            self.radioBtnHeight.constant = 0
            self.viewheight.constant = 800
            productNameLbl.text = "Selected product"
               
            self.navigationItem.title="Edit Product"
            self.sideMenuBtn.isEnabled = false
            self.sideMenuBtn.tintColor = UIColor.clear
            let imgBack = UIImage(named: "Grub-X_0054_left-arrow")
                                    
            navigationController?.navigationBar.backIndicatorImage = imgBack
            navigationController?.navigationBar.backIndicatorTransitionMaskImage = imgBack
                                    
            navigationItem.leftItemsSupplementBackButton = true
            navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
              
             
        }else{
             
            self.radioBtnStackView.isHidden = false
                       self.view2.isHidden = false
                       self.view3.isHidden = false
                       self.view8.isHidden = false
                       self.cancelBtn.isHidden = false
            self.radioBtnHeight.constant = 30
            self.viewheight.constant = 1050
              productNameLbl.text = "Product Image"
            
            self.navigationController?.isNavigationBarHidden = false
            self.navigationItem.title = "Add Product"
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
            self.navigationController?.navigationBar.tintColor = .white
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.view.backgroundColor = .white
            
                   

        }
            
       }
    
    @IBAction func selectCategoryTF(_ sender: UITextField) {
        
        selectCategoryTF.resignFirstResponder()
        category()
        
    }
    @IBAction func dropdownTap(_ sender: Any) {
       // print("hiiii")
        //selectcategoryApi()
        category()
       
       
     //   dropdata()
       
        
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
       
        if textView == productDescriptionTV {
            productDescriptionTV.text = ""
        }
    }
    
    @IBAction func saveTap(_ sender: Any) {
        if self.secondary=="products"{

         if productNameTF.text!.count == 0 {
                                         
             
                  SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter valid product name") {
             
                      self.productNameTF.becomeFirstResponder()
                                        
                  }
                                         
                                    
              }else if quantityTF.text?.count==0 {
                                         
             
                  SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter Quantity") {
            
                      self.quantityTF.becomeFirstResponder()
                                        
                  }
                                         
                                    
              }else if originalPriceTF.text?.count==0 {
                                         
             
                  SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter original price") {
            
                      self.originalPriceTF.becomeFirstResponder()
                                      
                  }
                                         
                                    
              }else if offerPriceTf.text?.count==0 {
                                         
            
                  SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter Offer Price") {
             
                      self.offerPriceTf.becomeFirstResponder()
                                       
                  }
                                         
                                     
              }else if stockTF.text?.count==0 {
                                               
                  
                  SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter Stock") {
                   
                      self.stockTF.becomeFirstResponder()
                                             
                  }
              }else if productDescriptionTV.text?.count==0 {
                                                          
                             
                  SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter Description") {
                             
                      self.productDescriptionTV.becomeFirstResponder()
                                                       
                  }
                                                          
                                                      
              }else{
                                      
                                        
                  addProductsApi()
                                    
              }
            
            
            
        }
        else{
        
        if selectCategoryTF.text?.count==0 {
                                       
        SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please Select Category") {
            
            self.selectCategoryTF.becomeFirstResponder()
                                       
            }
                                       
                                       
            
        }else if subCategoryTF.text?.count==0 {
                                       
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please Select Subcategory") {
          
                self.selectCategoryTF.becomeFirstResponder()
                                      
            }
                                       
                                
        }else if productNameTF.text!.count == 0 {
                                   
       
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter valid product name") {
       
                self.productNameTF.becomeFirstResponder()
                                  
            }
                                   
                              
        }else if quantityTF.text?.count==0 {
                                   
       
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter Quantity") {
      
                self.quantityTF.becomeFirstResponder()
                                  
            }
                                   
                              
        }else if originalPriceTF.text?.count==0 {
                                   
       
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter original price") {
      
                self.originalPriceTF.becomeFirstResponder()
                                
            }
                                   
                              
        }else if offerPriceTf.text?.count==0 {
                                   
      
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter Offer Price") {
       
                self.offerPriceTf.becomeFirstResponder()
                                 
            }
                                   
                               
        }else if stockTF.text?.count==0 {
                                         
            
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter Stock") {
             
                self.stockTF.becomeFirstResponder()
                                       
            }
        }else if productDescriptionTV.text?.count==0 {
                                                    
                       
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter Description") {
                       
                self.productDescriptionTV.becomeFirstResponder()
                                                 
            }
                                                    
                                                
        }else{
                                
                                  
            addProductsApi()
                              
        }
        
        
        }
        
       // addProductsApi()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //edit()
        print(datafromVC1.count)
        if secondary=="products"{
            
            self.productNameTF.text=datafromVC1[0].name
            self.stockTF.text=datafromVC1[0].stock
            self.quantityTF.text=datafromVC1[0].quantity
            self.productUnitsTF.text=datafromVC1[0].units
            self.offerPriceTf.text=datafromVC1[0].offerPrice
            self.originalPriceTF.text=datafromVC1[0].price
            self.productDescriptionTV.text=datafromVC1[0].description
            var picture=pic+datafromVC1[0].imgUrl1!
            print(picture)
            var picture2=pic+datafromVC1[0].imgUrl2!
             var picture3=pic+datafromVC1[0].imgUrl3!
            //print(picture)edit
          // category()
            var some=datafromVC1[0].categoriesId
              print(datafromVC1[0].categoriesId)
            print(self.editidArray)
            print(editName)
           // self.selectCategoryTF.text=datafromVC1[0].categoriesId
           // self.subCategoryTF.text=datafromVC1[0].subCategoriesId
            print(some)
//            for i in 0..<self.editidArray.count{
//             // print(editName[3])
//                if String(some!) == String(i){
//                  print("matched")
//                self.selectCategoryTF.text=String(i)
//                    print(selectCategoryTF.text)
//                }
//                else{
//                    print("np")
//                }
//            }
         if let imageUrl = datafromVC1[0].imgUrl1{
            var trimmedStr = String()
                               var baseUrlStr = String()
                               var imgUrlStr = datafromVC1[0].imgUrl1 as? String
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
                        //let url = URL(string: imagepath+imageUrl)
            self.productImg1.kf.setImage(with: url, for:.normal)
                      
                       }
//            if let imageUrl = datafromVC1[0].imgUrl2{
//                                  let url = URL(string: imagepath+imageUrl)
//                      self.productImg2.kf.setImage(with: url, for:.normal)
//
//                                 }
            if let imageUrl = datafromVC1[0].imgUrl2{
                       var trimmedStr = String()
                                          var baseUrlStr = String()
                                          var imgUrlStr = datafromVC1[0].imgUrl2 as? String
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
                                   //let url = URL(string: imagepath+imageUrl)
                       self.productImg2.kf.setImage(with: url, for:.normal)
                                 
                                  }
            
//            if let imageUrl = datafromVC1[0].imgUrl3{
//                                             let url = URL(string: imagepath+imageUrl)
//                                 self.productImg3.kf.setImage(with: url, for:.normal)
//
//                                            }
            if let imageUrl = datafromVC1[0].imgUrl3{
                       var trimmedStr = String()
                                          var baseUrlStr = String()
                                          var imgUrlStr = datafromVC1[0].imgUrl3 as? String
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
                                   //let url = URL(string: imagepath+imageUrl)
                       self.productImg3.kf.setImage(with: url, for:.normal)
                                 
                                  }

                      self.sideMenuBtn.isEnabled = false
                      self.sideMenuBtn.tintColor = UIColor.clear
                      let imgBack = UIImage(named: "Grub-X_0054_left-arrow")
                             
                      navigationController?.navigationBar.backIndicatorImage = imgBack
                      navigationController?.navigationBar.backIndicatorTransitionMaskImage = imgBack
                             
                      navigationItem.leftItemsSupplementBackButton = true
                      navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
       
        
            
            
            
        }
        
        productDescriptionTV.delegate=self
        activeBtn.isSelected=true
        customBtn.isSelected=true
       
        
        view1.layer.masksToBounds = false
        view1.layer.shadowColor = UIColor.black.cgColor
        view1.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view1.layer.shadowOpacity = 0.5
        
        view2.layer.masksToBounds = false
        view2.layer.shadowColor = UIColor.black.cgColor
        view2.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view2.layer.shadowOpacity = 0.5
        
        view3.layer.masksToBounds = false
        view3.layer.shadowColor = UIColor.black.cgColor
        view3.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view3.layer.shadowOpacity = 0.5
        
        view4.layer.masksToBounds = false
        view4.layer.shadowColor = UIColor.black.cgColor
        view4.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view4.layer.shadowOpacity = 0.5
        
        view5.layer.masksToBounds = false
        view5.layer.shadowColor = UIColor.black.cgColor
        view5.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view5.layer.shadowOpacity = 0.5
        
        view6.layer.masksToBounds = false
        view6.layer.shadowColor = UIColor.black.cgColor
        view6.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view6.layer.shadowOpacity = 0.5
        
        view7.layer.masksToBounds = false
        view7.layer.shadowColor = UIColor.black.cgColor
        view7.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view7.layer.shadowOpacity = 0.5
        
        view8.layer.masksToBounds = false
        view8.layer.shadowColor = UIColor.black.cgColor
        view8.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view8.layer.shadowOpacity = 0.5
        
        view9.layer.masksToBounds = false
        view9.layer.shadowColor = UIColor.black.cgColor
        view9.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view9.layer.shadowOpacity = 0.5
        
        
        
        
        
        
        
        if SingleToneClass.shared.isInternetAvailable()==false{
                                
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message:  "Please check your internet connection") {
                                     
                               
            }
                            
        }

    }
    
    func dropdata(){


        self.logoutDropDown.show()

         logoutDropDown.anchorView = selectCategoryTF
         logoutDropDown.dataSource = self.categoriesName
         logoutDropDown.bottomOffset = CGPoint(x: 0, y:(logoutDropDown.anchorView?.plainView.bounds.height)!)
         dropdowncustom.textColor = UIColor.black
         dropdowncustom.backgroundColor = UIColor.white
         
        logoutDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
         self.selectCategoryTF.text = item
           

            
         }
    }
    
    func productUnitsDropDown () {


        self.logoutDropDown.show()

         logoutDropDown.anchorView = productUnitsTF
         logoutDropDown.dataSource = productUnitsArray
         logoutDropDown.bottomOffset = CGPoint(x: 0, y:(logoutDropDown.anchorView?.plainView.bounds.height)!)
         dropdowncustom.textColor = UIColor.black
         dropdowncustom.backgroundColor = UIColor.white
         
        logoutDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
         self.productUnitsTF.text = item
           

            
         }
    }
    
    func addTransperentView(){
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
    
    func category(){
            

                  
        var token =  UserDefaults.standard.object(forKey: "Token") as! String
                          
        let header = ["Accept" : "application/json","Authorization" : "Bearer \(token)"]
        Alamofire.request(API.categories,headers: header).responseObject { (response: DataResponse<Category>) in
            //print(response)
    
            KRProgressHUD.dismiss()
                 
            let initialresponse = response.result.value
                 // print(initialresponse)
                
            if let resultdata = initialresponse?.data {
                     
                for data in resultdata {

                    self.categoriesName.append(data.name ?? "novalue")
                    self.categoriesid.append(data.id ?? 0)
                       

                      
                    self.dropdata()
                       
                     
                }
                   
                 
            }
             
        }
     
       
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
                          

                         
                      // self.dropdata()
                          
                        
                   }
                print(self.categoriesid)
                    
               }
                
           }
        
          
       }
   
    func subcategory(){
       // print(self.selectCategoryLbl.text)
        if selectCategoryTF.text == categoriesName[0]{
          
            self.id = categoriesid[0]
       
        }else if selectCategoryTF.text == categoriesName[1] {
               
            self.id = categoriesid[1]
            
        } else if selectCategoryTF.text == categoriesName[2] {
                                   
            self.id = categoriesid[2]
            
               
        }else if selectCategoryTF.text == categoriesName[3] {
                                         
            self.id = categoriesid[3]
                
                   
        }else if selectCategoryTF.text == categoriesName[4] {
                                           
            self.id = categoriesid[4]
                    
                        
        }else if selectCategoryTF.text == categoriesName[5] {
                                                
            self.id = categoriesid[5]
                        
                           
        }else if selectCategoryTF.text == categoriesName[6] {
                                                   
            self.id = categoriesid[6]
                            
                              
        }
        else if selectCategoryTF.text == categoriesName[7] {
                                                   
            self.id = categoriesid[7]
                            
                              
        }
        
        else if selectCategoryTF.text == categoriesName[8] {
                                                   
            self.id = categoriesid[8]
                            
                              
        }
        
        else if selectCategoryTF.text == categoriesName[9] {
                                                   
            self.id = categoriesid[9]
                            
                              
        }
        
        else if selectCategoryTF.text == categoriesName[10] {
                                                   
            self.id = categoriesid[10]
                            
                              
        }
        
        else if selectCategoryTF.text == categoriesName[11] {
                                                   
            self.id = categoriesid[11]
                            
                              
        }
        
        else if selectCategoryTF.text == categoriesName[12] {
                                                   
            self.id = categoriesid[12]
                            
                              
        }
  
        var token =  UserDefaults.standard.object(forKey: "Token") as! String
                             
        let header = ["Accept" : "application/json","Authorization" : "Bearer \(token)"]
        
        
        
        Service.shared.GETCallService(serviceType: "http://grubx.srimaruthienterprises.in/api/subcategories/\(self.id!)") { (response) -> (Void) in
          //  print(response)
            let data = response["data"].dictionary
           // print(data)
            for subcategory in (data?["subcategories"]?.array)!{
                let subDic = subcategory.dictionary
                let name = subDic?["name"]?.string
                self.subcategoriesNameArr.append(name!)
               
               // print( self.subcategoriesNameArr)
                let id = subDic?["id"]?.int
                self.subId = id
                 self.subDrop()
               // print(self.subId)
                
            }
           
            
        }

    }
    
    
    func subDrop(){
         subDropdown.show()
         subDropdown.anchorView = subCategoryTF
        subDropdown.dataSource =  self.subcategoriesNameArr
         subDropdown.bottomOffset = CGPoint(x: 0, y:(subDropdown.anchorView?.plainView.bounds.height)!)
               // subDropdown.bottomOffset = CGPoint(x: 0, y:200)
         subdropdowncustom.textColor = UIColor.black
         subdropdowncustom.backgroundColor = UIColor.white
         
        subDropdown.selectionAction = { [unowned self] (index: Int, item: String) in
         self.subCategoryTF.text = item
            
            
         }
    }
    
    
    func addProductsApi(){
        
        if self.secondary=="products"{
            let login = UserDefaults.standard.object(forKey: "LoginID") as! Int
                 let businessid = UserDefaults.standard.object(forKey: "userBusinessId")
//            print(finalcategoryid)
//           // print(finalsu)
//            print(productNameTF.text)
//            print(self.imgurl1)
            print(self.finalcategoryid)
           // "categories_id":self.finalcategoryid,"sub_categories_id":self.finalsubcategoryid,
            var parameters = ["users_id":login,"categories_id":self.finalcategoryid,"name":self.productNameTF.text!,"price":self.originalPriceTF.text!,"stock":self.stockTF.text!,"offer_price":self.offerPriceTf.text!,"description":self.productDescriptionTV.text!,"quantity":self.quantityTF.text!,"units":"kg"] as [String : Any]
           // ,"status":"0","is_featured":"1"
           // ,"business_id":businessid!,
              // print(parameters)
                 KRProgressHUD.show(withMessage: "please wait") {

                                                        }
            
            Service.shared.makeUploadRequest(serviceType: API.updateProduct + self.finalProductId, parameters: parameters) { response in
                                   print(response)
                                        KRProgressHUD.dismiss()
                                    guard let success = response.dictionary else {return}
                let result=success["message"]?.string
print(result)
                let successMsg = success["success"]?.int

                             self.succesStatus = successMsg
                                              if self.succesStatus == 1{

                                               KRProgressHUD.dismiss()
                                                SingleToneClass.shared.showValidationAlert(target: self, title: "success !", message: result!) {
                                              let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                                               let gotoOTP = storyBoard.instantiateViewController(withIdentifier: "ProductsViewController") as! ProductsViewController
                                                self.navigationController?.pushViewController(gotoOTP, animated: true)
                                               }

                                               }

                                                   else{
                                                   KRProgressHUD.dismiss()
                                               SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message: "Failed to add products") {

                                                           }

                                               }






                               }



        }
        else{
        
         let login = UserDefaults.standard.object(forKey: "LoginID") as! Int
        let businessid = UserDefaults.standard.object(forKey: "userBusinessId")
        var parameters = ["users_id":login,"categories_id":self.id!,"sub_categories_id":self.subId!,"name":self.productNameTF.text!,"price":self.originalPriceTF.text!,"stock":self.stockTF.text!,"offer_price":self.offerPriceTf.text!,"description":self.productDescriptionTV.text!,"quantity":self.quantityTF.text!,"img_url1":self.imgurl1!,"img_url2":self.imgurl2!,"img_url3":self.imgurl3!,"business_id":businessid!,"units":"22","status":"0","is_featured":"1"] as [String : Any]
     // print(parameters)
        KRProgressHUD.show(withMessage: "please wait") {

                                               }
        if let data = self.imgurl1{
                          
            parameters["img_url1"] = AGImageInfo(fileName: "file.jpeg", type: .png, data: data)
            
                           
                       }
        if let data = self.imgurl2{
                              
            parameters["img_url2"] = AGImageInfo(fileName: "file.jpeg", type: .png, data: data)
            
                  
                                 
                             }
        if let data = self.imgurl3{
                                    
            parameters["img_url3"] = AGImageInfo(fileName: "file.jpeg", type: .png, data: data)
                   
                         
                                        
                                    }
      
        
       Service.shared.makeUploadRequest(serviceType: API.addProduct, parameters: parameters) { response in
                         // print(response)
                              
        KRProgressHUD.dismiss()
                           
        guard let success = response.dictionary else {return}
                                    
        if success["message"]!.string! == "Product created successfully."{
                          
                                    
            KRProgressHUD.dismiss()
                                    
            SingleToneClass.shared.showValidationAlert(target: self, title: "success !", message: "Product Added Succesfully") {
                                   
                let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                                     
                let gotoOTP = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
                                       
                self.navigationController?.pushViewController(gotoOTP, animated: true)
                                     
            }
                          
                                    
        }else{
                                        
            KRProgressHUD.dismiss()
                                      
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message: "Failed to add products") {
                          
                                                
            }
                          
                                    
        }
                          
                          
                     
        }
        
        
      //  }
        
 
    }
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if picker == picker1{
           
            guard let image = info[.originalImage] as? UIImage else {
                           fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
                    
            }
                
                
               //imageView.contentMode = .scaleAspectFit
               self.productImg1.setImage(image, for: .normal)
                self.productImg1.clipsToBounds = true
                    let imageData = image.jpegData(compressionQuality: 0.8)
            self.imgurl1 = imageData
             
              //  self.imgurl1 = imageSaveData
        //let base64String = String(data:imageSaveData!,encoding:.utf8)
             //  self.imagepick1 = pickedImage
               // print(self.imagepick1)
                //let data = image?.pngData()
               // let data = image?.jpegData(compressionQuality: 0.9)
               // self.imgurl1 = UIImage(data: imageSaveData!)
            }
        else if picker == self.picker2{
                
            guard let image = info[.originalImage] as? UIImage else {
            
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
                
            }
            
           
           //imageView.contentMode = .scaleAspectFit
           self.productImg2.setImage(image, for: .normal)
                   let imageData = image.jpegData(compressionQuality: 0.8)
            self.productImg2.clipsToBounds = true
                     self.imgurl2 = imageData
                    
            // let base64String = String(data:imageSaveData!,encoding:.utf8)
           // self.imgurl2 = imagesave
                
        }else{
         guard let image = info[.originalImage] as? UIImage else {
                                                  fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
                                              }
                   
                  
                  //imageView.contentMode = .scaleAspectFit
                  self.productImg3.setImage(image, for: .normal)
             let imageData = image.jpegData(compressionQuality: 0.8)
                      self.productImg3.clipsToBounds = true
                               self.imgurl3 = imageData
               }
               

            
            dismiss(animated: true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
    

}

}
extension NSMutableData {
    
    func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}
extension String {
    var fileURL: URL {
        return URL(fileURLWithPath: self)
    }
    var pathExtension: String {
        return fileURL.pathExtension
    }
    var lastPathComponent: String {
        return fileURL.lastPathComponent
    }
}
