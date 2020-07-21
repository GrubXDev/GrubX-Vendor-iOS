//
//  FilterViewController.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 19/03/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
import KRProgressHUD
import DropDown
class FilterViewController: UIViewController,UITextFieldDelegate {
    var id:Int!
       var subId:Int!
    var subcategoriesNameArr = [String]()
    @IBOutlet weak var subCategoryTF: UITextField!
    
    @IBOutlet weak var subCategoryBtnTap: UIButton!
    
 var categoriesName = [String]()
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
    
    @IBOutlet weak var selectCategortTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        // Do any additional setup after loading the view.
    }
    
 
    
    @IBAction func oncatagoryTF(_ sender: Any) {
    
        selectCategortTF.resignFirstResponder()
                 category()
    
    
    }
    
    @IBAction func subCatagoryTF(_ sender: Any) {
        
        subCategoryTF.resignFirstResponder()
                   
            
        if selectCategortTF.text == "" {
                   
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message: "Please Select Categories") {
                                    
                  
            }
               
        }else{
                
            self.subCategoryBtnTap.isUserInteractionEnabled=true
                         
                 
            subcategory()
               
        }
        
        
        
    }
    
  
    
 
    @IBAction func subCategoryDrop(_ sender: Any) {

          if selectCategortTF.text == "" {
              SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message: "Please Select Categories") {
                  
              }
          }else{
              self.subCategoryBtnTap.isUserInteractionEnabled=true
         
              subcategory()
          }
        
        
        
    }
    
    @IBAction func onCatDropDap(_ sender: Any) {
        
        category()
       
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
 
    func subcategory(){
         
        // print(self.selectCategoryLbl.text)
           if selectCategortTF.text == categoriesName[0]{
             
               self.id = categoriesid[0]
          
           }else if selectCategortTF.text == categoriesName[1] {
                  
               self.id = categoriesid[1]
               
           } else if selectCategortTF.text == categoriesName[2] {
                                      
               self.id = categoriesid[2]
               
                  
           }else if selectCategortTF.text == categoriesName[3] {
                                            
               self.id = categoriesid[3]
                   
                      
           }else if selectCategortTF.text == categoriesName[4] {
                                              
               self.id = categoriesid[4]
                       
                           
           }else if selectCategortTF.text == categoriesName[5] {
                                                   
               self.id = categoriesid[5]
                           
                              
           }else if selectCategortTF.text == categoriesName[6] {
                                                      
               self.id = categoriesid[6]
                               
                                 
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
    func dropdata(){


        self.logoutDropDown.show()

         logoutDropDown.anchorView = selectCategortTF
         logoutDropDown.dataSource = self.categoriesName
         logoutDropDown.bottomOffset = CGPoint(x: 0, y:(logoutDropDown.anchorView?.plainView.bounds.height)!)
         dropdowncustom.textColor = UIColor.black
         dropdowncustom.backgroundColor = UIColor.white
         
        logoutDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
         self.selectCategortTF.text = item
           

            
         }
    }
    
    
    @IBAction func applyBtn(_ sender: Any) {
        
         self.view.removeFromSuperview()
    }
    
}
