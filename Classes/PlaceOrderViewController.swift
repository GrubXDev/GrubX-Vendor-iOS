//
//  PlaceOrderViewController.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 26/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import KRProgressHUD
import SDWebImage


class PlaceOrderViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,PlaceOrderCollectionViewCellDelegate,UITextFieldDelegate {
    var CatalogueProducts:[CatalogueProductDetailData] = []
    @IBOutlet weak var createBtnHeight: NSLayoutConstraint!
      
     func updateCart(cell: PlaceOrderCollectionViewCell) {
           
          if cell.addBtn.isSelected == true {
                             print("a")
                    // self.sendData.append(CatalogueProducts[cell.addBtn.tag].name!)
                    
                         
              cell.checkBtn.setImage( UIImage(named:"Grub-X_0032_check-mark-copy-2"), for: .normal)
             // cell.checkBtn.isHidden=false
              Constants.check = true
                    // self.countData.append(cell.countLabel.text!)
              cell.countTF.becomeFirstResponder()
              createBtnHeight.constant=40
              cell.addBtn.isHidden =  true
                      //cell.plusMinusStackView.isHidden = true
              cell.addBtn.isSelected = true
              cell.countTF.isHidden=false
                          
              
             // self.selectedRowIndex.insert(cell.addBtn.tag, at: cell.addBtn.tag)
              
          }else{
          
              //cell.checkBtn.isHidden=true
              print("b")
              createBtnHeight.constant=0
              cell.addBtn.isHidden =  false
                          //cell.plusMinusStackView.isHidden = true
              cell.addBtn.isSelected = false
                    
              
          }
      }
      
      
      func updateClick(cell: PlaceOrderCollectionViewCell) {
          
          if cell.checkBtn.isSelected == true {
            
                             print("a")
                    // self.sendData.append(CatalogueProducts[cell.addBtn.tag].name!)
                    
                         
                    
                    // self.countData.append(cell.countLabel.text!)
              
                          
                      self.selectedRowIndex.insert(cell.addBtn.tag, at: cell.addBtn.tag)
                       
           }else{
                             print("b")
              
                    
                         }
      }
      
      func updateTF(cell: PlaceOrderCollectionViewCell) {
          
            self.idsArray.append(CatalogueProducts[cell.addBtn.tag].id!)
            self.productIDsArray.append(CatalogueProducts[cell.addBtn.tag].productsId!)//sainath
            self.sendData.append(CatalogueProducts[cell.addBtn.tag].name!)
            self.countData.append(cell.countTF.text!)
            self.priceArray.append(CatalogueProducts[cell.addBtn.tag].price!)
//          print(countData)
      }
    
    private let spacing:CGFloat = 8.0
    
    @IBOutlet weak var view1: UIView!
    
     @IBOutlet weak var collView: UICollectionView!
    var idsArray=[String]()
    var productIDsArray = [String]()
    var countData=[String]()
    var sendData:[String] = []
    
     var priceArray=[String]()
     var selectedRowIndex = [Int]()
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
             return CatalogueProducts.count
         }
         
         func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
             let cell=collView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PlaceOrderCollectionViewCell
             cell.addBtn.tag = indexPath.row
              //self.getPAth=cell.addBtn.tag
             cell.addBtn.isSelected = true
             //cell.plusMinusStackView.isHidden = true
             cell.addBtn.isHidden = false
             cell.delegate =  self

            var trimmedStr = String()
             var baseUrlStr = String()
            let imgUrlStr = CatalogueProducts[indexPath.row].imgUrl1
         //   print(imgUrlStr!)
             
             if (imgUrlStr?.contains(" "))!{
                 
             let  trimmedString = imgUrlStr?.replacingOccurrences(of: " ", with: "%20")
                 
                 trimmedStr = trimmedString!
                baseUrlStr = bannerlink + (trimmedStr )
                 
               // print("trimmedStringtrimmedString",trimmedString!)
             }else{
                 baseUrlStr = bannerlink + (imgUrlStr ?? "")
             }
             
             let  url = URL.init(string: baseUrlStr)
        //    print("URL===========",url! )
            
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
             cell.countTF.delegate=self
             if selectedRowIndex.contains(indexPath.row) {
                
                 
                 cell.addBtn.isHidden =  true
                 
                 //cell.plusMinusStackView.isHidden = false
             }else{
                 cell.addBtn.isHidden =  false
                 //cell.plusMinusStackView.isHidden = true
             }
             return cell
         }


     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                    let numberOfItemsPerRow:CGFloat = 3
                  //  let spacingBetweenCells:CGFloat = 2
                    
                   // let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
                    
                    if let collection = self.collView{
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
   
    override func viewDidLoad() {
        super.viewDidLoad()
                KRProgressHUD.show()
        api()
        view1.layer.cornerRadius = 10
        view1.layer.borderWidth = 1
        view1.layer.borderColor = UIColor.red.cgColor
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = false
       
        self.navigationItem.title = "Place Order"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
              
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = .white
              
          
    }
    func api(){
         let userid = UserDefaults.standard.object(forKey: "LoginID") as! Int
               let accessToken = UserDefaults.standard.object(forKey: "Token") as! String
                       let header = ["Accept" : "application/json","Authorization" : "Bearer \(accessToken)"]
                 
        let conn=String(userid)
        let extraconn="/0/0"
        print(conn)
                Alamofire.request(API.catalogueProducts + conn + extraconn,headers: header).responseObject { (response: DataResponse<CatalogueProductDetail>) in
        KRProgressHUD.dismiss()
                      let initialresponse = response.result.value
                      
                    if let resultdata = initialresponse?.data {
                          for data in resultdata
                          {
                              self.CatalogueProducts.append(data)
                          }
                        print(self.CatalogueProducts)
                          self.collView.reloadData()
                      }
                  }
        
    }
    
    @IBAction func createBtnTap(_ sender: Any) {
        

         
                let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        
        
                let vc = storyBoard.instantiateViewController(withIdentifier: "PlaceOrderBuyersViewController") as! PlaceOrderBuyersViewController
                    vc.placeOrderProductsidsArray=self.idsArray
                    vc.placeOrderProductsProductIDSArray = self.productIDsArray//sainath
                    vc.placeOrderProductsCountArray=self.countData
       
                vc.id="placeorder"
        
                self.navigationController?.pushViewController(vc, animated: true)
                
    }
    
    @IBAction func filterBtnTap(_ sender: Any) {
        
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "FilterViewController")as! FilterViewController

               let transition:CATransition = CATransition()
               transition.duration = 0.3
               transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
               transition.type = CATransitionType.push
               transition.subtype = CATransitionSubtype.fromLeft
               self.navigationController!.view.layer.add(transition, forKey: kCATransition)

               self.navigationController?.pushViewController(obj, animated: true)
        
        
    }
    
}
