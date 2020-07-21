//
//  TabBar4ViewController.swift
//  Grub X Vender
//
//  Created by Ashish dattu on 25/01/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
import KRProgressHUD
import Toast_Swift

var status=true
var selectedIndexess=0
var imagelink="http://grubx.srimaruthienterprises.in/storage/cover_images/"
var mybuyersValue=String()
var grubxBuyersVAlue=String()

class TabBar4ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,MyBuyersTableViewCellDelegate,GrubXBuyersTableViewCellDelegate{
    
    
    
    func updateClick(cell: MyBuyersTableViewCell) {
         
        if cell.checkBtn.isSelected == true {
                                  
            print("a")
       
        }else{
                               
            print("b")
                          
        }
    }
    
    
    func updateClick2(cell: GrubXBuyersTableViewCell) {
        
        if cell.checkBtn.isSelected == true {
                                 
            print("a")
            
        }else{
                                 
            print("b")
                         
        }
    }
    
    
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var sideMenuBtn: UIBarButtonItem!
    //    var myBuyersvalue="1"
    //    var grubxBuyersvalue="2"
   
    
    var mybuyersValue=String()
    var grubxBuyersVAlue=String()
    var placeOrderProductsidsArray=[String]()
    var placeOrderProductsCountArray=[String]()
    var finalProductsidsArray=[String]()
    var finalProductsCountArray=[String]()
    var parametersArray: [String: Any] = [:]
    var name=String()
    var imageUrl=String()
    var price=String()
    var offerPrice=String()
    var buyersidArray=[String]()
    var id=String()
    
      // var id=String()
    
    @IBOutlet weak var viewTopHeight: NSLayoutConstraint!
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var myBuyersView: UIView!
    @IBOutlet weak var grubxBuyersView: UIView!
    @IBOutlet weak var myBuyersTblView: UITableView!
    @IBOutlet weak var filterViewHeight: NSLayoutConstraint!
   
    @IBOutlet weak var buyerBtn: UIButton!
    @IBOutlet weak var buyerView: UIView!
    @IBOutlet weak var topBuyerBtn: UIButton!
    @IBOutlet weak var topBuyerView: UIView!
    @IBOutlet weak var tblView: UITableView!
    
    
    var succesStatus:Int!
    var messageStatus:String!
    var errorStatus:String!

       
    var buyersData:[AllBuyersData] = []
    var GrubxbuyersData:[AllBuyersData] = []
    
    
     private let spacing:CGFloat = 8.0
    
    
    
     let grayColour = UIColor(red: 143.0/255.0, green: 143.0/255.0, blue: 143.0/255.0, alpha: 1.0)
     let redColour = UIColor(red: 203.0/255.0, green: 8.0/255.0, blue: 22.0/255.0, alpha: 1.0)
     
     
       
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if tabBarController?.selectedIndex==3{
            
        }
        KRProgressHUD.show()
       
        mybuyersValue="1"
       

        
        
        api()
        
        filterView.layer.cornerRadius = 10
        filterView.layer.borderWidth = 1
        filterView.layer.borderColor = UIColor.red.cgColor
        
        if SingleToneClass.shared.isInternetAvailable()==false{
                                
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message:  "Please check your internet connection") {
                                     
                                 
            }
                            
        }
        
    }
    

    @IBAction func buyerBtn(_ sender: Any) {
        
        
        
       
        grubxBuyersView.isHidden=true
        myBuyersView.isHidden=false
        //filterView.isHidden = true
        filterViewHeight.constant = 0
        
      
        buyerBtn.setTitleColor(redColour, for: [])
        self.buyerView.backgroundColor = redColour
        topBuyerBtn.setTitleColor(grayColour, for: [])
        self.topBuyerView.backgroundColor = grayColour
        //self.collection2.reloadData()
        
        mybuyersValue="1"
        api()
        
    }
    
    
    @IBAction func topBuyerBtn(_ sender: Any) {
        //favourites()
        
        GrubxbuyersData.removeAll()
        
        grubxBuyersVAlue="2"
        mybuyersValue="0"
        myBuyersView.isHidden=true
        grubxBuyersView.isHidden=false
      //  filterView.isHidden = false
        
        filterViewHeight.constant = 36
        KRProgressHUD.show()
        api2()
        
        buyerBtn.setTitleColor(grayColour, for: [])
        self.buyerView.backgroundColor = grayColour
        topBuyerBtn.setTitleColor(redColour, for: [])
        self.topBuyerView.backgroundColor = redColour
       // self.collection2.reloadData()
        
        
    }
  
     func api(){
          
       buyersData.removeAll()
        
        let accessToken = UserDefaults.standard.object(forKey: "Token") as! String
        
        let header = ["Accept" : "application/json","Authorization" : "Bearer \(accessToken)"]

        
        Alamofire.request(API.allBuyers,headers: header).responseObject { (response: DataResponse<AllBuyers>) in
        
            KRProgressHUD.dismiss()
            
            let initialresponse = response.result.value

            
            if let resultdata = initialresponse?.data {
            
                for data in resultdata {
                
                    self.buyersData.append(data)
                               
                    
                }
                print(self.buyersData)
                self.myBuyersTblView.reloadData()
                
            }
            
        }

       }
    
    
   
    
    func api2(){
       
       

        grubxBuyersVAlue="2"
           
        let accessToken = UserDefaults.standard.object(forKey: "Token") as! String
                         
        let header = ["Accept" : "application/json","Authorization" : "Bearer \(accessToken)"]

                  
        Alamofire.request(API.allBuyers,headers: header).responseObject { (response: DataResponse<AllBuyers>) in
         
            KRProgressHUD.dismiss()
                       
            let initialresponse = response.result.value

                      
            if let resultdata = initialresponse?.data {
                            
                for data in resultdata {
                               
                    self.GrubxbuyersData.append(data)
                    
                               
                             
                }
                            
                self.tblView.reloadData()
                         
            }
                    
        }

      
    }
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if mybuyersValue=="1"{
            return buyersData.count
            }
            else if grubxBuyersVAlue=="2"{
                return GrubxbuyersData.count
            }
            else{
                return 1
            }
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
            if mybuyersValue=="1"{
                
                let cell=myBuyersTblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyBuyersTableViewCell
                   
                if Constants.buyerCheck == true {
                      
                    cell.checkBtn.isHidden = false
                    cell.checkBtnWidth.constant = 20
                    Constants.buyerCheck = false
                    
                }else{
                      
                    cell.checkBtn.isHidden = true
                    cell.checkBtnWidth.constant = 0
                    Constants.buyerCheck = false
                }
                
                
                   
                cell.businessName.text=buyersData[indexPath.row].businessName
                cell.businessPincode.text=buyersData[indexPath.row].pincode ?? "No data"
                cell.businessContact.text=buyersData[indexPath.row].phone ?? "No MobileNumbert"
                //cell.checkBtn.isHidden=true
                //cell.checkBtn.addTarget(self, action: #selector(self.editTapped(_:)), for: .touchUpInside)
                
                 return cell
            }
            else {
                let cell=tblView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! GrubXBuyersTableViewCell
                
                
                if Constants.buyerCheck == true {
                    cell.checkBtn.isHidden = false
                    Constants.buyerCheck = false
                }else{
                    cell.checkBtn.isHidden = true
                    Constants.buyerCheck = false
                }
                
                if let imageUrl = GrubxbuyersData[indexPath.row].imgUrl{
                        let url = URL(string: bannerlink+imageUrl)
                       //let url = URL(string: path!+conn+categoryData[indexPath.row].imgUrl!)!
                       cell.imgView.kf.setImage(with: url)
                cell.businessName.text=buyersData[indexPath.row].businessName
                cell.businessAddress.text=buyersData[indexPath.row].pincode ?? "No data"
                cell.businessMobileNo.text=buyersData[indexPath.row].phone ?? "No MobileNumbert"
                }
                     return cell
               
            }
            
        }
    
    
//    @IBAction func editTapped(_ sender:UIButton){
//
//        if status==true{
//            //checkBtn.setImage( UIImage(named:"Grub-X_0032_check-mark-copy-2"), for: .normal)
//
//            status=false
//        }
//        else{
//
//        }
//
//          }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           if mybuyersValue=="1"{
            return 90
            }
            else if grubxBuyersVAlue=="2"{
                return 225
            }
           else{
            return 100
            }
        }
    
    override func viewWillAppear(_ animated: Bool) {
         
        if Constants.buyerCheck == false {
                      
//            self.sendBtn.isHidden=false
//            self.sideMenuBtn.isEnabled = false
//            self.sideMenuBtn.tintColor = UIColor.clear
//
//
//            let imgBack = UIImage(named: "Grub-X_0054_left-arrow")
//            navigationController?.navigationBar.backIndicatorImage = imgBack
//            self.navigationItem.title = "Buyers"
//            navigationController?.navigationBar.backIndicatorTransitionMaskImage = imgBack
//            navigationItem.leftItemsSupplementBackButton = true
//            navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
            
            
            self.sendBtn.isHidden=true
            self.navigationController?.isNavigationBarHidden = false
            self.tabBarController?.tabBar.isHidden = false
            self.navigationItem.title = "Buyers"
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
            self.navigationController?.navigationBar.tintColor = .white
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.view.backgroundColor = .white
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for:[])
              
                    
        }else{
                            
                       
            self.sendBtn.isHidden=false
            self.sideMenuBtn.isEnabled = false
            self.sideMenuBtn.tintColor = UIColor.clear
            let imgBack = UIImage(named: "Grub-X_0054_left-arrow")
            navigationController?.navigationBar.backIndicatorImage = imgBack
            self.navigationItem.title = "Buyers"
            navigationController?.navigationBar.backIndicatorTransitionMaskImage = imgBack
            navigationItem.leftItemsSupplementBackButton = true
            navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
                     
        }
        
        
        
//        if id=="1"{
//
//
//
//        }else if self.id=="product"{
//
//
//
//        }else{
//
//            self.sendBtn.isHidden=true
//            self.navigationController?.isNavigationBarHidden = false
//            self.tabBarController?.tabBar.isHidden = false
//
//       // self.navigationItem.title = "Dashboard"
//            self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
//            self.navigationController?.navigationBar.tintColor = .white
//            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//            self.navigationController?.navigationBar.isTranslucent = false
//            self.navigationController?.view.backgroundColor = .white
//
//            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for:[])
//
//        }
      
    }
    
    
    

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//          if mybuyersValue=="1"{
//              //self.buyersidArray.removeAll()
//              self.buyersidArray.append(buyersData[indexPath.row].id!)
//              print(buyersidArray)
//          }
//          else{
//              //self.buyersidArray.removeAll()
//              self.buyersidArray.append(GrubxbuyersData[indexPath.row].id!)
//              print(buyersidArray)
//          }
//          //self.buyersidArray.append()
//      }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             
        if mybuyersValue=="1"{
               
            let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                                                   
            let gotoOTP = storyBoard.instantiateViewController(withIdentifier: "BuyerDetailsViewController") as! BuyerDetailsViewController
               
            gotoOTP.id=Int(buyersData[indexPath.row].id!)!
                
            print(gotoOTP.id)
                                                     
            self.navigationController?.pushViewController(gotoOTP, animated: true)
                
    //              //self.buyersidArray.removeAll()
    //              self.buyersidArray.append(buyersData[indexPath.row].id!)
    //              print(buyersidArray)
             
        }else{
               
            let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                                                         
            let gotoOTP = storyBoard.instantiateViewController(withIdentifier: "BuyerDetailsViewController") as! BuyerDetailsViewController
                        
            gotoOTP.id=Int(GrubxbuyersData[indexPath.row].id!)!
            
                        
            print(gotoOTP.id)
                                                                
            self.navigationController?.pushViewController(gotoOTP, animated: true)
    
            //self.buyersidArray.removeAll()
   
            //   self.buyersidArray.append(GrubxbuyersData[indexPath.row].id!)
   
            //    print(buyersidArray)
              
        }
             
        //self.buyersidArray.append()
         
    }
    @IBAction func sendBtnTap(_ sender: Any) {
        
        if self.id=="1"{
                  KRProgressHUD.show()
             sendApi()
              }
              else if self.id=="product"{
                  KRProgressHUD.show()
                  placeOrder()
                  
              }
        
        
    }
     func sendApi(){
            
                    let userid = UserDefaults.standard.object(forKey: "LoginID") as! Int
                    print(userid)
            
            
            print(parametersArray)
            let people = Dictionary(uniqueKeysWithValues: zip(self.finalProductsidsArray, self.finalProductsCountArray))
            
            print(people)
            var parameters = ["users_id":String(userid),"products":people,"buyers":buyersidArray,"name":self.name,"price":self.price,"offer_price":self.offerPrice,"img_url1":imageUrl,"type":"1"] as [String : Any]
         //  print(imageUrl)
    //        if let data = imageUrl{
    //                           parameters["img_url1"] = AGImageInfo(fileName: "file.jpeg", type: .png, data: data)
    //
    //                       }
          //  print(parameters)
                         KRProgressHUD.show()
                         Service.shared.POSTService(serviceType:API.specialCataloguesend, parameters: parameters as [String : Any]) { (response) -> (Void) in
                             KRProgressHUD.dismiss()
                             print(response)
                             let responseDic = response.dictionary
                            let result=responseDic!["message"]?.string
                             let successMsg = responseDic?["success"]?.int
                             self.succesStatus = successMsg
                        if self.succesStatus == 1{
                                  SingleToneClass.shared.showValidationAlert(target: self, title: "GrubX !", message: result ?? "failed") {
                                                                                 let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomePageViewController")
                                                                                                           
                                                                                                   
                                                                                            self.navigationController?.pushViewController(vc!, animated: true)
                                                                     
                                                                                                           
                                                                 }
                             }else{

                                 KRProgressHUD.dismiss()

                                  self.view.makeToast(result ?? "failed", duration: 1.0, position: .center)
                             }


                         }
       
            
        }
        func placeOrder(){
             
                     let userid = UserDefaults.standard.object(forKey: "LoginID") as! Int
                     print(userid)
             
             
             print(parametersArray)
             let people = Dictionary(uniqueKeysWithValues: zip(self.placeOrderProductsidsArray, self.placeOrderProductsCountArray))
             
             print(people)
             var parameters = ["users_id":String(userid),"products":people,"buyers":buyersidArray] as [String : Any]
            
            // print(parameters)
                          KRProgressHUD.show()
                          Service.shared.POSTService(serviceType:API.placeOrder, parameters: parameters as [String : Any]) { (response) -> (Void) in
                              KRProgressHUD.dismiss()
                              print(response)
                              let responseDic = response.dictionary
                             let result=responseDic!["message"]?.string
                              let successMsg = responseDic?["success"]?.int
                              self.succesStatus = successMsg
                         if self.succesStatus == 1{
    //                             self.view.makeToast(result ?? "failed", duration: 1.0, position: .center)
    //
                            SingleToneClass.shared.showValidationAlert(target: self, title: "GrubX !", message: result ?? "failed") {
                                                       let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomePageViewController")
                                                                                 
                                                                         
                                                                  self.navigationController?.pushViewController(vc!, animated: true)
                                           
                                                                                 
                                       }

                                   
                              }else{

                                  KRProgressHUD.dismiss()

                                   self.view.makeToast(result ?? "failed", duration: 1.0, position: .center)
                              }


                          }
        
             
         }
    
    @IBAction func filterTap(_ sender: Any) {
//        let obj = self.storyboard?.instantiateViewController(withIdentifier: "FilterViewController")as! FilterViewController
//
//               let transition:CATransition = CATransition()
//               transition.duration = 0.3
//               transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//               transition.type = CATransitionType.push
//               transition.subtype = CATransitionSubtype.fromLeft
//               self.navigationController!.view.layer.add(transition, forKey: kCATransition)
//
//               self.navigationController?.pushViewController(obj, animated: true)
        
        let POPUPVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FilterViewController") as! FilterViewController
                     
               self.addChild(POPUPVC)
               POPUPVC.view.frame = CGRect.init(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
               
               self.view.addSubview(POPUPVC.view)
               POPUPVC.didMove(toParent: self)
               
    }
    
}
//checkBtn.setImage( UIImage(named:"Grub-X_0032_check-mark-copy-2"), for: .normal)
//checkBtn.setImage( UIImage(named:"Grub-X_0031_Layer-5-copy-2"), for: .normal)
