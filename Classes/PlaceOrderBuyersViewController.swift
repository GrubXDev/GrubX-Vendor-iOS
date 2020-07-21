//
//  PlaceOrderBuyersViewController.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 20/03/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
import KRProgressHUD
var status1=true
var selectedIndexess1=0
var imagelink1="http://grubx.srimaruthienterprises.in/storage/cover_images"
var mybuyersValue1=String()
var grubxBuyersVAlue1=String()

class PlaceOrderBuyersViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,FirstTableViewCellDelegate {
    
    func updateClick(cell: FirstTableViewCell) {
       
        if  cell.selectedCheckbox == true {
                                          print("a")
            print(cell.checkBtn.tag)
            self.buyersidArray.append(Int(buyersData[cell.checkBtn.tag].id!)!)
//            print("buyersID's",buyersidArray)
                                 // self.sendData.append(CatalogueProducts[cell.addBtn.tag].name!)
                                 
                                      
                                 
                                 // self.countData.append(cell.countLabel.text!)
                           
                                       
                                   //self.selectedRowIndex.insert(cell.addBtn.tag, at: cell.addBtn.tag)
                                    
                        }else{
                                          print("b")
                           
                                 
                                      }
    }
    
    let grayColour = UIColor(red: 143.0/255.0, green: 143.0/255.0, blue: 143.0/255.0, alpha: 1.0)
        let redColour = UIColor(red: 203.0/255.0, green: 8.0/255.0, blue: 22.0/255.0, alpha: 1.0)
    @IBOutlet weak var topBuyerView: UIView!
    @IBOutlet weak var buyerView: UIView!
    @IBOutlet weak var grubxBuyerBtn: UIButton!
    @IBOutlet weak var myBuyersBtn: UIButton!
    @IBOutlet weak var grubxBuyersView: UIView!
    @IBOutlet weak var myBuyersView: UIView!
    var placeOrderProductsidsArray=[String]()
    var placeOrderProductsCountArray=[String]()
    var placeOrderProductsProductIDSArray = [String]()
    var finalProductsidsArray=[String]()
    var finalProductsCountArray=[String]()
    var finalProductsProIDSArray = [String]()
    var finalArrayOfIDProductIDCount = [[String : Any]]() //sainath
    var parametersArray: [String: Any] = [:]
    var name=String()
     var imageUrl=String()
    var price=String()
    var offerPrice=String()
    var buyersidArray=[Int]()
       var id=String()
    var succesStatus:Int!
       var messageStatus:String!
       var errorStatus:String!

//    var mybuyersValue=String()
//    var grubxBuyersVAlue=String()
   // var mybuyersValue1=String()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if mybuyersValue1=="1"{
                   return buyersData.count
                   }
                   else if grubxBuyersVAlue1=="2"{
                       return GrubxbuyersData.count
                   }
                   else{
                       return 1
                   }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          if mybuyersValue1=="1"{
                      
                      let cell=myBuyersTblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FirstTableViewCell
            cell.checkBtn.tag=indexPath.row

            cell.delegate=self
                      cell.businessNameLbl.text=buyersData[indexPath.row].businessName
                      cell.businessPincodeLbl.text=buyersData[indexPath.row].pincode ?? "No data"
                      cell.businessMobileLbl.text=buyersData[indexPath.row].phone ?? "No MobileNumbert"
                     
                       return cell
                  }
                  else {
                      let cell=grubxBuyersTblView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! SecondTableViewCell
                      
        
                    //  if let imageUrl = GrubxbuyersData[indexPath.row].imgUrl{
                              //let url = URL(string: imagepath+imageUrl)
                             //let url = URL(string: path!+conn+categoryData[indexPath.row].imgUrl!)!
                             //cell.imgView.kf.setImage(with: url)
            var trimmedStr = String()
                        var baseUrlStr = String()
                        var imgUrlStr = GrubxbuyersData[indexPath.row].imgUrl as? String
                     //   print(imgUrlStr)
                        
                        if (imgUrlStr?.contains(" "))!{
                            
                        let  trimmedString = imgUrlStr?.replacingOccurrences(of: " ", with: "%20")
                            
                            trimmedStr = trimmedString!
                            baseUrlStr = bannerlink + (trimmedStr ?? "")
                            
//                        print("trimmedStringtrimmedString",trimmedString)
                        }else{
                            baseUrlStr = bannerlink + (imgUrlStr ?? "")
                        }
                        
                        let  url = URL.init(string: baseUrlStr)
//                        print("URL===========",url )
                       
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
                      cell.businessNameLbl.text=buyersData[indexPath.row].businessName
                      cell.businessAddressLbl.text=buyersData[indexPath.row].pincode ?? "No data"
                      cell.businessMobileLBL.text=buyersData[indexPath.row].phone ?? "No MobileNumbert"
                     // }
                           return cell
                     
                  }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
              if mybuyersValue1=="1"{
               return 90
               }
               else if grubxBuyersVAlue1=="2"{
                   return 225
               }
              else{
               return 100
               }
           }
    var buyersData:[AllBuyersData] = []
      var GrubxbuyersData:[AllBuyersData] = []
   
    @IBOutlet weak var grubxBuyersTblView: UITableView!
    
    @IBOutlet weak var myBuyersTblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        KRProgressHUD.show()
              
               mybuyersValue1="1"
              
      //  print("ID's : \(placeOrderProductsidsArray) Product_ID : \(placeOrderProductsProductIDSArray) count: \(placeOrderProductsCountArray)")

        
               api()
        // Do any additional setup after loading the view.
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//                      self.buyersidArray.append(buyersData[indexPath.row].id!)
//        print(buyersidArray)
//    }

    @IBAction func myBuyerBtnTap(_ sender: Any) {
        grubxBuyersView.isHidden=true
               myBuyersView.isHidden=false
               //filterView.isHidden = true
               //filterViewHeight.constant = 0
               
             
               myBuyersBtn.setTitleColor(redColour, for: [])
               self.buyerView.backgroundColor = redColour
               grubxBuyerBtn.setTitleColor(grayColour, for: [])
               self.topBuyerView.backgroundColor = grayColour
               //self.collection2.reloadData()
               
               mybuyersValue1="1"
               api()
    }

    @IBAction func grubxBuyersBtnTap(_ sender: Any) {
        GrubxbuyersData.removeAll()
              
              grubxBuyersVAlue1="2"
              mybuyersValue1="0"
              myBuyersView.isHidden=true
              grubxBuyersView.isHidden=false
            //  filterView.isHidden = false
              
              //filterViewHeight.constant = 36
              KRProgressHUD.show()
              api2()
              
              myBuyersBtn.setTitleColor(grayColour, for: [])
              self.buyerView.backgroundColor = grayColour
              grubxBuyerBtn.setTitleColor(redColour, for: [])
              self.topBuyerView.backgroundColor = redColour
        
        
        
    }
    func api(){
//       print("hii")
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
//                 print(self.buyersData)
                 self.myBuyersTblView.reloadData()
                 
             }
             
         }

        }
     
     
    
     
     func api2(){
        
        

         grubxBuyersVAlue1="2"
            
         let accessToken = UserDefaults.standard.object(forKey: "Token") as! String
                          
         let header = ["Accept" : "application/json","Authorization" : "Bearer \(accessToken)"]

                   
         Alamofire.request(API.allBuyers,headers: header).responseObject { (response: DataResponse<AllBuyers>) in
          
             KRProgressHUD.dismiss()
                        
             let initialresponse = response.result.value

                       
             if let resultdata = initialresponse?.data {
                             
                 for data in resultdata {
                                
                     self.GrubxbuyersData.append(data)
                     
                                
                              
                 }
                             
                 self.grubxBuyersTblView.reloadData()
                          
             }
                     
         }
        

       
     }
    
    @IBAction func onSendBtnTap(_ sender: Any) {
        
        if self.id=="placeorder"{
        
        placeOrder()
        }
        else{
            sendApi()
        }
        
    }
    func placeOrder()
    {
             
                     let userid = UserDefaults.standard.object(forKey: "LoginID") as! Int
//                     print(userid)
             
             
            // print(parametersArray)
             //let people = Dictionary(uniqueKeysWithValues: zip(self.placeOrderProductsidsArray, self.placeOrderProductsCountArray))
        
            
       //      print("People", people)
       
           //  var parameters = ["users_id":String(userid),"products":people,"buyers_id":buyersidArray] as [String : Any]
            
        
        //prd_id, prd_count, products_id
        
        
        finalArrayOfIDProductIDCount.removeAll()
        for (index, element) in placeOrderProductsCountArray.enumerated()
        {
            print("Pcount : \(element) pID :\(placeOrderProductsidsArray[index]),PPID:\(placeOrderProductsProductIDSArray[index])")
            let tempDict = ["prd_id":Int(placeOrderProductsidsArray[index])!,
                            "products_id":Int(placeOrderProductsProductIDSArray[index])!,
                            "prd_count":Int(element)!] as[String : Any]
            finalArrayOfIDProductIDCount.append(tempDict)
        }
        
        let parameters = ["users_id":String(userid),
                          "products":finalArrayOfIDProductIDCount,
                          "buyers_id":buyersidArray] as [String: Any]
        
             print("parameters ", parameters)
        
        
        
        
                          KRProgressHUD.show()
                          Service.shared.POSTService(serviceType:API.placeOrder, parameters: parameters as [String : Any]) { (response) -> (Void) in
                              KRProgressHUD.dismiss()
                              print("Response :",response)
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
    func sendApi(){
            //not using now
                    let userid = UserDefaults.standard.object(forKey: "LoginID") as! Int
                    print(userid)
      print(buyersidArray)
        print(self.finalProductsidsArray)
        print(finalProductsCountArray)
            print(parametersArray)
            let people = Dictionary(uniqueKeysWithValues: zip(self.finalProductsidsArray, self.finalProductsCountArray))
            
            print(people)
            var parameters = ["users_id":String(userid),"products_id":people,"buyers":buyersidArray,"name":self.name,"price":self.price,"offer_price":self.offerPrice,"img_url1":imageUrl,"type":"1"] as [String : Any]
         //  print(imageUrl)
    //        if let data = imageUrl{
    //                           parameters["img_url1"] = AGImageInfo(fileName: "file.jpeg", type: .png, data: data)
    //
    //                       }
            print(parameters)
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
    
}
