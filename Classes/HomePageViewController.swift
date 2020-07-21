//
//  HomePageViewController.swift
//  Grub X Vender
//
//  Created by Ashish dattu on 25/01/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import KRProgressHUD
import Kingfisher

var bannerlink="http://grubx.srimaruthienterprises.in/storage/cover_images/"
var bannersData:[SlidingBannersData] = []


class HomePageViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource {
//var bannersData:[SlidingBannersData] = []
    
    var categoryData:[pendingDatum] = []
    var subOrders:[ordersData] = []

    var sepid=String()
    
    @IBOutlet weak var pageCount: UIPageControl!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var pendingBtn: UIButton!
    @IBOutlet weak var pendingView: UIView!
    @IBOutlet weak var upcomingBtn: UIButton!
    @IBOutlet weak var upcomingView: UIView!
    @IBOutlet weak var completedBtn: UIButton!
    @IBOutlet weak var completedView: UIView!
    @IBOutlet weak var poolOrderBtn: UIButton!
    @IBOutlet weak var poolOrderView: UIView!
    @IBOutlet weak var zipCodeStackView: UIStackView!
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var zipcodeHeight: NSLayoutConstraint!
    
      var limit = 0
      var x: Int = 0
      var strIndex:Int = 1
    
   
    
    var upComing:Bool?
    var pending:Bool?
    var completed:Bool?
    var poolOrder:Bool?
    
     let grayColour = UIColor(red: 111/255.0, green: 111/255.0, blue: 111/255.0, alpha: 1.0)
      let redColour = UIColor(red: 203.0/255.0, green: 13/255.0, blue: 26/255.0, alpha: 1.0)
    
    
    override func viewWillAppear(_ animated: Bool) {
          
        
          banners()
          self.navigationController?.isNavigationBarHidden = false
          self.tabBarController?.tabBar.isHidden = false
          scrollViewDidEndDecelerating(collection)
          self.navigationItem.title = UserDefaults.standard.object(forKey: "BusinessName") as? String
          self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
          self.navigationController?.navigationBar.tintColor = .white
          self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
          self.navigationController?.navigationBar.isTranslucent = false
          self.navigationController?.view.backgroundColor = .white
        
          UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for:[])

        
        
        self.sepid="1"
             
        KRProgressHUD.show(withMessage: "please wait") {

                                         
        }
              
        subcategory()
              
        table.register(UINib(nibName: "HeaderTableCell", bundle: nil), forCellReuseIdentifier: "HeaderTableCell")
                  
                  
        table.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailTableViewCell")
               
        table.register(UINib(nibName: "FooterTableViewCell", bundle: nil), forCellReuseIdentifier: "FooterTableViewCell")
              
        bannersData.removeAll()
              
        KRProgressHUD.show()
              
       
              
        setTimer()
            
              
        if SingleToneClass.shared.isInternetAvailable()==false{
                                     
                   
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message:  "Please check your internet connection") {
                                          
                                    
                   
            }
                                  
              
        }

             
      
        

      }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
     
        
       
        let floawLayout = UPCarouselFlowLayout()
                    
        floawLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width, height: collection.frame.size.height)
                     
        floawLayout.scrollDirection = .horizontal
                  
        floawLayout.sideItemScale = 1.0
                    
        collection.collectionViewLayout = floawLayout
                   
        collection.isPagingEnabled = true
        
        // Do any additional setup after loading the view.
    }
  
    func setTimer() {
                  
        let timer = Timer.scheduledTimer(timeInterval:5.0, target: self, selector: #selector(self.autoScroll), userInfo: nil, repeats: true)
                  
                       
                 
    }
                   
                   
                   // var x = 1
                  
    @objc func autoScroll() {
                       
        if (self.x < bannersData.count) {
                           
                          
            pageCount.currentPage = x
            let indexPath = IndexPath(item: x, section: 0)
            self.collection.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.x = self.x + 1
                           
                      
        }else {
                          
            self.x = 0
                          
                      
        }
                       
                  
    }
  
    
    @IBAction func faqBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "FAQViewController") as! FAQViewController
                     
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func pendingBtn(_ sender: Any) {
       poolOrder = false
        pending = true
        self.sepid="1"
        categoryData.removeAll()
        subOrders.removeAll()
        KRProgressHUD.show()
        subcategory()
        //self.table.reloadData()
        pendingBtn.setTitleColor(redColour, for: [])
        self.pendingView.backgroundColor = redColour
        upcomingBtn.setTitleColor(grayColour, for: [])
        self.upcomingView.backgroundColor = grayColour
        completedBtn.setTitleColor(grayColour, for: [])
        self.completedView.backgroundColor = grayColour
        poolOrderBtn.setTitleColor(grayColour, for: [])
        self.poolOrderView.backgroundColor = grayColour
        
        
    }
    
    
    
    @IBAction func upcomingBtn(_ sender: Any) {
        poolOrder = false
        upComing = true
        self.sepid="2"
        categoryData.removeAll()
        subOrders.removeAll()
        KRProgressHUD.show()
        subcategory()
        //self.table.reloadData()
       // self.table.reloadData()
        
        pendingBtn.setTitleColor(grayColour, for: [])
        self.pendingView.backgroundColor = grayColour
        upcomingBtn.setTitleColor(redColour, for: [])
        self.upcomingView.backgroundColor = redColour
        completedBtn.setTitleColor(grayColour, for: [])
        self.completedView.backgroundColor = grayColour
        poolOrderBtn.setTitleColor(grayColour, for: [])
        self.poolOrderView.backgroundColor = grayColour
        
    }
    
    
    
    @IBAction func completedBtn(_ sender: Any) {
       poolOrder = false
        completed = true
        self.sepid="3"
        categoryData.removeAll()
        subOrders.removeAll()
        KRProgressHUD.show()
        subcategory()
       // self.table.reloadData()
        pendingBtn.setTitleColor(grayColour, for: [])
        self.pendingView.backgroundColor = grayColour
        upcomingBtn.setTitleColor(grayColour, for: [])
        self.upcomingView.backgroundColor = grayColour
        completedBtn.setTitleColor(redColour, for: [])
        self.completedView.backgroundColor = redColour
        poolOrderBtn.setTitleColor(grayColour, for: [])
        self.poolOrderView.backgroundColor = grayColour
    }
    
    
    @IBAction func poolOrderBtn(_ sender: Any) {
      
        poolOrder = true
        print(poolOrder)
       // upComing = true
        self.sepid="3"
        categoryData.removeAll()
        subOrders.removeAll()
        KRProgressHUD.show()
        subcategory()
       // self.table.reloadData()
        pendingBtn.setTitleColor(grayColour, for: [])
        self.pendingView.backgroundColor = grayColour
        upcomingBtn.setTitleColor(grayColour, for: [])
        self.upcomingView.backgroundColor = grayColour
        completedBtn.setTitleColor(grayColour, for: [])
        self.completedView.backgroundColor = grayColour
        poolOrderBtn.setTitleColor(redColour, for: [])
        self.poolOrderView.backgroundColor = redColour
    }
    
    
    
    @IBAction func bellBtn(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "MessagesAndNotificationsViewController") as! MessagesAndNotificationsViewController
                            
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        
        pageCount.numberOfPages = bannersData.count
       
        return bannersData.count
      
    }
      
      
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          
     
          
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomePageCollectionViewCell
         
        if let imageUrl = bannersData[indexPath.row].imgUrl {
                                
            let url = URL(string: bannerlink+imageUrl)
           // cell.cellImage.stopShimmeringAnimation()
            //et url = URL(string: path!+conn+categoryData[indexPath.row].imgUrl!)!
                               
            cell.cellImage.kf.setImage(with: url)

    
          
      
        }
   
        return cell
    
    }

      
     
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offSet = scrollView.contentOffset.x
        
        let width = collection.frame.width
        let horizontalCenter = collection.frame.size.width / 2

         pageCount.currentPage = Int(offSet + horizontalCenter) / Int(width)
         

    }
      
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          
        
        return CGSize(width:collection.frame.width, height: collection.frame.height)
 
    }
    
     
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
     
    {
         
        var visibleRect = CGRect()
       

          
        visibleRect.origin = collection.contentOffset
        visibleRect.size =  collection.bounds.size
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
          
        guard let indexPath =  collection.indexPathForItem(at: visiblePoint) else { return
            
        }

         
        x = indexPath.row

         
         
        strIndex = indexPath.row
      

         
        let indexPathrow = IndexPath(item: x, section: 0)
         
        self.collection.scrollToItem(at: indexPathrow, at: .centeredHorizontally, animated: true)

     
    }
      
  
     
    func numberOfSections(in tableView: UITableView) -> Int{
          
        return categoryData.count
        
    }
        
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
           
        return subOrders.count;
        
    }
        
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
           
              
        let cellIdentifier = "DetailTableViewCell"
        let cell = table.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DetailTableViewCell
    //cell?.nameLbl.text=subOrders[indexPath.row].id
//       cell?.nameLbl.text=subOrders[indexPath.row].name ?? ""
//            
//            cell?.ordernumLbl.text=categoryData[indexPath.section].orderNumber
//            cell?.locLbl.text=categoryData[indexPath.section].deliveryLocation
//            cell?.quantityLbl.text=categoryData[indexPath.section].orderamount
           
        if let imageUrl = subOrders[indexPath.row].img_url1{
                          
            let url = URL(string: bannerlink+imageUrl)
                      
            //let url = URL(string: path!+conn+categoryData[indexPath.row].imgUrl!)!
               
            cell!.imgView.kf.setImage(with: url)
           
        }
               
        return cell!
            
          
           
    }
            
            
        
        
       
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
        DispatchQueue.main.async {
                
           
        }
       
    }
       
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                       
          
        return 100
                        
           
       
    }
       
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {


           
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableCell") as! HeaderTableCell
             print(poolOrder)
            
//            if poolOrder == true {
//                headerCell.view1.isHidden = false
//                headerCell.view2.backgroundColor = UIColor(red: 162/255, green: 187/255, blue: 70/255, alpha: 1.0)
//                headerCell.view2.layer.cornerRadius = 0
//                headerCell.view1.layer.cornerRadius = 10
//
//            }else{
//               headerCell.view1.isHidden = true
//               headerCell.view2.backgroundColor = UIColor(red: 60/255, green: 75/255, blue: 98/255, alpha: 1.0)
//                headerCell.view2.layer.cornerRadius = 10
//            }
            
            
            
//            headerCell.ordernumLbl.text=categoryData[section].orderNumber ?? ""
//             headerCell.orderno2Lbl.text=categoryData[section].orderNumber
//             headerCell.buyernameLbl.text=categoryData[section].buyername
//             headerCell.deliverylocLbl.text=categoryData[section].deliveryLocation
           // headerView.addSubview(headerCell)
           
        return headerCell
        
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerCell = tableView.dequeueReusableCell(withIdentifier: "FooterTableViewCell") as! FooterTableViewCell
       
         return footerCell
    }
    
    
    
    
       
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
   
       if section % 2 == 0{
                   
              //     if poolOrder == true {
              //         return 220
              //     }else{
              //          return 120
              //     }
                   
                   return 250
              
               }else{
                
                   return 250   
                   
                   
          
               }
              
           }
   
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
      
        return 70
    }
    
    
    func banners(){
       bannersData.removeAll()
       // let userid = UserDefaults.standard.object(forKey: "LoginID") as! Int
                            
        let accessToken = UserDefaults.standard.object(forKey: "Token") as! String
                                   
        let header = ["Accept" : "application/json","Authorization" : "Bearer \(accessToken)"]
                              
                  
                            
        Alamofire.request(API.banners,headers: header).responseObject { (response: DataResponse<SlidersBanners>) in
                   
            KRProgressHUD.dismiss()
                                  
            let initialresponse = response.result.value
                                   
                                 
            if let resultdata = initialresponse?.data {
                                     
                for data in resultdata {
                                        
                    bannersData.append(data)
                                      
                }
                                 
                self.collection.reloadData()
                                   
            }
                              
        }
        
        
        
        
    }
    
    
    
    
    func subcategory(){
       
        self.categoryData.removeAll()
       
        self.subOrders.removeAll()
            
        // usersubcategories/userid/categoty_id
             
        //  let login = UserDefaults.standard.object(forKey: "LoginID") as! Int
             
        //let tokenAndDeviceType="usersubcategories/\(String(login))/\(self.id!)"
                 
        var conn=sepid
      
        Service.shared.GETService2(extraParam: API.pending + conn) { (response) -> (Void) in
                   
            DispatchQueue.global(qos: .background).async {
                                        
                DispatchQueue.main.async {
                                        
                    KRProgressHUD.dismiss()
                                                 
                    guard let SuccessGet = response.dictionary else{return}
                                         
                    guard let data = SuccessGet["data"]?.array else{return}
                                          
                                                        
                    for get in data{
                                                         
                        var FinalData = pendingDatum()
                                                        
                        FinalData.ordersId = get["orders_id"].string!
                                                        
                        FinalData.orderNumber = get["order_number"].string!
                                                          
                        FinalData.buyername = get["buyername"].string!
                                                           
                        FinalData.deliveryLocation = get["delivery_location"].string!
                                                            
                        FinalData.orderDate = get["order_date"].string!
                                                           
                        FinalData.orderamount = get["orderamount"].string!;
                        self.categoryData.append(FinalData)
                                                         
                        guard let subdata = get["orders_products"].array else{return}
                                                         
                        for data2 in subdata{
                                                             
                            var sub = ordersData()
                                                              
                                                             
                            sub.id = data2["id"].string!
                                                            
                            sub.name = data2["name"].string!
                                                           
                            sub.img_url1 = data2["img_url1"].string!
                                                           
                            //  print(sub.id)
                                                           
                            // sub.quantity = data2["quantity"].string! ?? "no data"
                                                             
                            self.subOrders.append(sub)
                            
                        }
                      
                                                          
                                                    
                    }
                                                    
                    // print(self.categoryData)
                                       
                    //  print(self.subOrders)
                                                     
                    //self.subCategoryCollView.reloadData()
                      
                                         
                    self.table.reloadData()
                                                               
                
                }
                                      
                                                              }
                 
                            }
                 
             }

   
}
