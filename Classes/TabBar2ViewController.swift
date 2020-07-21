//
//  TabBar2ViewController.swift
//  Grub X Vender
//
//  Created by Ashish dattu on 25/01/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import KRProgressHUD
class TabBar2ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    var type=Int()
    var invoicesData:[InvoiceModeldata] = []
    var invoiceOrderData:[OrdersProduct] = []
    var invoiceAmountData:[AmountDetail] = []
    var grubxPayment:[GrubxPaymentModelData] = []
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if tableView == grubXTblView {
       
            return grubxPayment.count
       
        }else{
            
             return invoicesData[section].ordersProducts!.count
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == grubXTblView {
           
            return 1
        }else{
            return invoicesData.count
        }
        
   
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              
        if tableView == grubXTblView {
            
            let cell = grubXTblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? InvoiceGrubXPaymentTableViewCell
         
            
            let a = grubxPayment[indexPath.row].createdAt
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:SS"

            let showDate = dateFormatter.date(from: a!)
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let resultString = dateFormatter.string(from: showDate!)
            print(resultString)
                            
            
            cell?.dateLbl.text=resultString 
            cell?.amountLbl.text=grubxPayment[indexPath.row].amount
            return cell!
            
        }else{
            
            let cellIdentifier = "InvoiceDetailTableViewCell"
                             
                  
            let cell = tblView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? InvoiceDetailTableViewCell
                      
            cell?.productNameLbl.text=invoiceOrderData[indexPath.row].name
                      
            cell?.priceLbl.text=invoiceOrderData[indexPath.row].price
                            
            return cell!
        }
                 
       
            
               
             
              
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                        
        return 50
                          
             
          
    }
         
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        if tableView==tblView{

        let headerCell = tblView.dequeueReusableCell(withIdentifier: "InvoiceHeaderTableViewCell") as! InvoiceHeaderTableViewCell

        headerCell.oredrNumLbl.text=invoicesData[section].orderNumber ?? "empty"

        headerCell.dateLbl.text=invoicesData[section].orderDate

        headerCell.buyerNameLbl.text=invoicesData[section].buyername


        headerCell.view1.layer.cornerRadius = 20

        return headerCell
       
        }else{
            
                      
            let headerCell = grubXTblView.dequeueReusableCell(withIdentifier: "GrubxHeaderTableViewCell") as! GrubxHeaderTableViewCell
            
            return headerCell
            
           
        }


    }

    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if tableView==tblView{
        let footerCell = tblView.dequeueReusableCell(withIdentifier: "InvoiceFooterTableViewCell") as! InvoiceFooterTableViewCell

        footerCell.subTotalLbl.text=invoiceAmountData[section].subtotalamount
        footerCell.deliveryChargesLbl.text=invoiceAmountData[section].deliveryCharges
        footerCell.totalAmountLbl.text=invoiceAmountData[section].subtotalamount

            return footerCell
            
        }
        else{
                   
                             let footerCell = grubXTblView.dequeueReusableCell(withIdentifier: "GrubxFooterTableViewCell") as! GrubxFooterTableViewCell

//            tblView.tableFooterView?.isHidden=true
//            tblView.tableHeaderView?.isHidden=true
//                             grubXTblView.tableHeaderView?.isHidden=true
//                                         grubXTblView.tableFooterView?.isHidden=true
                              return footerCell
                  
               }

    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
     
         
//        if section % 2 == 0{
//
//              return 80
//
//          }else if tableView==tblView{
//
//              return 120
//
//          }
//        else if tableView==grubXTblView{
//            return CGFloat.leastNonzeroMagnitude
//        }
//        else{
//            return 0
//        }
        
        
        if tableView == tblView {
            if section % 2 == 0 {
                return 80
            }else{
                return 120
            }
        }else{
            return 0
        }
         
      }
     
      
      func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if tableView==tblView{
          return 130
        }
        else{
            return CGFloat.leastNonzeroMagnitude
        }
     }
    
    
    
    
    @IBOutlet weak var invoiceView: UIView!
    
    @IBOutlet weak var grubXInvoiceView: UIView!
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var grubXTblView: UITableView!
    @IBOutlet weak var pendingBtn: UIButton!
    @IBOutlet weak var pendingView: UIView!
    @IBOutlet weak var receivedBtn: UIButton!
    @IBOutlet weak var receivedView: UIView!
   @IBOutlet weak var filterView: UIView!
    
//    var limit = 0
//    var x: Int = 0
//    var strIndex:Int = 1
//
  
    
    
    let grayColour = UIColor(red: 143.0/255.0, green: 143.0/255.0, blue: 143.0/255.0, alpha: 1.0)
    let redColour = UIColor(red: 203.0/255.0, green: 8.0/255.0, blue: 22.0/255.0, alpha: 1.0)
       
       
    override func viewWillAppear(_ animated: Bool) {
             
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
     //   scrollViewDidEndDecelerating(collection)
        self.navigationItem.title = "Invoice"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = .white
           
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for:[])

//
//        KRProgressHUD.show()
//
//        api()
              
        tblView.register(UINib(nibName: "InvoiceHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "InvoiceHeaderTableViewCell")
                         
                        
        tblView.register(UINib(nibName: "InvoiceDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "InvoiceDetailTableViewCell")
                      
        tblView.register(UINib(nibName: "InvoiceFooterTableViewCell", bundle: nil), forCellReuseIdentifier: "InvoiceFooterTableViewCell")
             
        // setTimer()
              
                grubXTblView.register(UINib(nibName: "GrubxFooterTableViewCell", bundle: nil), forCellReuseIdentifier: "GrubxFooterTableViewCell")
        grubXTblView.register(UINib(nibName: "GrubxHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "GrubxHeaderTableViewCell")
               
        
        filterView.layer.cornerRadius = 10
              
        filterView.layer.borderWidth = 1
             
        filterView.layer.borderColor = UIColor.red.cgColor
               
             
        if SingleToneClass.shared.isInternetAvailable()==false{
                                       
                  
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message:  "Please check your internet connection") {
                                            
                                      
                  
            }
                                  
             
        }
      
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       KRProgressHUD.show()
             
       api()
grubXTblView.tableHeaderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: Double.leastNormalMagnitude))
        grubXTblView.tableFooterView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: Double.leastNormalMagnitude))
    }
    

    
    @IBAction func pendingBtn(_ sender: Any) {
        
        pendingBtn.setTitleColor(redColour, for: [])
        self.pendingView.backgroundColor = redColour
        receivedBtn.setTitleColor(grayColour, for: [])
        self.receivedView.backgroundColor = grayColour
        self.invoiceView.isHidden = false
        self.grubXInvoiceView.isHidden = true
        self.api()
        
        
    }
    
    @IBAction func receivedBtn(_ sender: Any) {
       // self.type=1
        
        //tblView.reloadData()
        pendingBtn.setTitleColor(grayColour, for: [])
        self.pendingView.backgroundColor = grayColour
        receivedBtn.setTitleColor(redColour, for: [])
        self.receivedView.backgroundColor = redColour
        self.invoiceView.isHidden = true
        self.grubXInvoiceView.isHidden = false
        KRProgressHUD.show()
        grubXTblView.delegate=self
        grubXTblView.dataSource=self
        self.api2()
        grubXTblView.tableHeaderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: Double.leastNormalMagnitude))
       // grubXTblView.tableHeaderView = nil
       // grubXTblView.tableFooterView = nil
        
    }
    
    @IBAction func bellBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "MessagesAndNotificationsViewController") as! MessagesAndNotificationsViewController
                            
        navigationController?.pushViewController(vc, animated: true)
    }
  
    
    
    func api(){
        
        self.invoicesData.removeAll()
        self.invoiceAmountData.removeAll()
        self.invoiceOrderData.removeAll()
        let accessToken = UserDefaults.standard.object(forKey: "Token") as! String
                                         
              let header = ["Accept" : "application/json","Authorization" : "Bearer \(accessToken)"]
                                    
                        
                                  
              Alamofire.request(API.invoice,headers: header).responseObject { (response: DataResponse<InvoiceModel>) in
                         
                  KRProgressHUD.dismiss()
                                        
                  let initialresponse = response.result.value
                                         
                                       
                  if let resultdata = initialresponse?.data {
                          print(resultdata)
                      for data in resultdata {
                                              
                        self.invoicesData.append(data)
                        self.invoiceAmountData.append(data.amountDetails!)
                        for ord in data.ordersProducts!{
                           
                        self.invoiceOrderData.append(ord)
                        
                        }
                        
                                            
                      }
                    //print(self.invoiceOrderData)
                      self.tblView.reloadData()
                                         
                  }
                                    
              }
             
    }
  
    
    
    func api2(){
        
        grubxPayment.removeAll()
        let accessToken = UserDefaults.standard.object(forKey: "Token") as! String
                                         
              let header = ["Accept" : "application/json","Authorization" : "Bearer \(accessToken)"]
                                  
              Alamofire.request(API.grubxPayment,headers: header).responseObject { (response: DataResponse<GrubxPaymentModel>) in
                         
                  KRProgressHUD.dismiss()
                                        
                  let initialresponse = response.result.value
                                         
                                       
                  if let resultdata = initialresponse?.data {
                          print(resultdata)
                      for data in resultdata {
                          
                        self.grubxPayment.append(data)
                                          
                      }
                    print(self.grubxPayment)
                    
                      self.grubXTblView.reloadData()
                                         
                  }
                                    
              }
             
    }
}
