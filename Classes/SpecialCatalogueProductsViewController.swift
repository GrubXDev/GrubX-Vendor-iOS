//
//  SpecialCatalogueProductsViewController.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 28/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import KRProgressHUD
import Kingfisher


var imagepathhere="http://grubx.srimaruthienterprises.in/storage/cover_images/"

class SpecialCatalogueProductsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,SpecialCatalogueProductsCollectionViewCellDelegate,UITextFieldDelegate {
   
 
   
    var idsArray=[String]()
    var data=["0"]
    var countTag=Int()
    var getPAth=Int()
    var counts = [Int]()
       
    //var indexQuantity = 0
    var selectedRowIndex = [Int]()
    var priceArray=[String]()
    var sendData:[String] = []
    var countData=[String]()
    var CatalogueProducts:[CatalogueProductDetailData] = []
      
    private let spacing:CGFloat = 8.0
    
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var collView: UICollectionView!
    
    @IBOutlet weak var createBtnHeight: NSLayoutConstraint!
    
     //var selectedIndex: Int = -1
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  CatalogueProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
      let cell=collView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SpecialCatalogueProductsCollectionViewCell
    
       
              
        cell.addBtn.tag = indexPath.row
        print(cell.addBtn.tag)
              
        self.getPAth=cell.addBtn.tag
        print(self.getPAth)
              
        cell.addBtn.isSelected = true
              
        cell.addBtn.isHidden = false
             
        cell.delegate =  self
         
        cell.countTF.delegate=self
              
        if selectedRowIndex.contains(indexPath.row) {
                  
           cell.addBtn.isHidden =  true
                   
      //      cell.plusMinusStackView.isHidden = false
               
        }else{
                 
            cell.addBtn.isHidden =  false
                  
         //   cell.plusMinusStackView.isHidden = true
               
        }
             
        // cell.addBtn.addTarget(self, action: #selector(self.editTapped(_:)), for: .touchUpInside)
        
              
        //if let imageUrl = CatalogueProducts[indexPath.row].imgUrl1{
             
        // let url = URL(string: imagepath+imageUrl)
              
        //let url = URL(string: path!+conn+categoryData[indexPath.row].imgUrl!)!
             
        //cell.imgView.kf.setImage(with: url)
        
        var trimmedStr = String()
        
        var baseUrlStr = String()
        
        let imgUrlStr = CatalogueProducts[indexPath.row].imgUrl1
       
        print(imgUrlStr as Any)
         
        
        if (imgUrlStr?.contains(" "))!{
             
        
            let  trimmedString = imgUrlStr?.replacingOccurrences(of: " ", with: "%20")
             
            
            trimmedStr = trimmedString!
            
            baseUrlStr = imagepathhere + (trimmedStr )
             
        
            print("trimmedStringtrimmedString",trimmedString as Any)
         
        }else{
           
            baseUrlStr = imagepathhere + (imgUrlStr ?? "")
       
        }
         
       
        let  url = URL.init(string: baseUrlStr)
        print("URL===========",url as Any )
        /* cell.imgView.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
             if (image != nil){
                 
                 cell.imgView.image = image
                cell.imgView.contentMode = .scaleAspectFit
             }else{
                 cell.imgView.image = UIImage.init(named:"budweisier_1584791337.jpg")
                 
             }
         }*/
        
        
         cell.imgView.contentMode = .scaleAspectFit
         cell.imgView.sd_setImage(with: url, placeholderImage:nil, options: .lowPriority, progress: nil, completed: { (image, error, cacheType, url) in
                    
                                
            if image != nil  {
                      
                cell.imgView.image = image
                       
                cell.imgView.contentMode = .scaleAspectFit
                        
            }else{
                        
                cell.imgView.image = UIImage.init(named:"budweisier_1584791337.jpg")
                                     
                             
            }
       
         })
             
        cell.nameLbl.text=CatalogueProducts[indexPath.row].name
             
        cell.priceLbl.text=CatalogueProducts[indexPath.row].price
                  // cell.countLabel.text=CatalogueProducts[indexPath.row].price
               //}
               
           
        return cell
    }
   
    
    
    func updateClick(cell: SpecialCatalogueProductsCollectionViewCell) {
        
        if cell.checkboxBtn.isSelected == true {
                              
            print("a")
           
            // self.sendData.append(CatalogueProducts[cell.addBtn.tag].name!)
            // self.countData.append(cell.countLabel.text!)
            //  self.selectedRowIndex.insert(cell.addBtn.tag, at: cell.addBtn.tag)
                              
                 
        }else{
                                  
            print("b")
                     
                           
        }
    }
    
    
    
    
    func updateCart(cell: SpecialCatalogueProductsCollectionViewCell) {
          
        if cell.addBtn.isSelected == true {
                                  
            print("a")
                            
            // self.sendData.append(CatalogueProducts[cell.addBtn.tag].name!)
                             
                                  
                     
            cell.checkboxBtn.setImage( UIImage(named:"Grub-X_0032_check-mark-copy-2"), for: .normal)
                     
            // cell.checkBtn.isHidden=false
                     
            Constants.check = true
                        
            // self.countData.append(cell.countLabel.text!)
                      
            cell.countTF.becomeFirstResponder()
                      
            createBtnHeight.constant=40
                      
            cell.addBtn.isHidden =  true
                         
            //cell.plusMinusStackView.isHidden = true
                      
            cell.addBtn.isSelected = true
                    
          //  cell.countTF.isHidden=false
            cell.countStackView.isHidden = false
                
            // self.selectedRowIndex.insert(cell.addBtn.tag, at: cell.addBtn.tag)
                       
                 
        }else{
                   
                    
            //cell.checkBtn.isHidden=true
                    
            print("b")
                     
            createBtnHeight.constant=0
                     
            cell.addBtn.isHidden =  false
            cell.countStackView.isHidden = true
                                
            //cell.plusMinusStackView.isHidden = true
                    
            cell.addBtn.isSelected = false
                             
                       
                  
        }
    
        
     }
//    @IBAction func editTapped(_ sender:UIButton){
//
//
//        self.collView.reloadData()
//
//    }
    
    
     func updateTF(cell: SpecialCatalogueProductsCollectionViewCell) {
             
            self.idsArray.append(CatalogueProducts[cell.addBtn.tag].id!)
            print(self.idsArray)
            self.sendData.append(CatalogueProducts[cell.addBtn.tag].name!)
            self.countData.append(cell.countTF.text!)
            self.priceArray.append(CatalogueProducts[cell.addBtn.tag].price!)
          print(countData)
            
        
         }
    
    
    
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
             
    
   
   
        let numberOfItemsPerRow:CGFloat = 3
   
        let spacingBetweenCells:CGFloat = 2
              
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
        
        collView.delegate =  self
        collView.dataSource = self
         KRProgressHUD.show()
        api()
        view1.layer.cornerRadius = 10
        view1.layer.borderWidth = 1
        view1.layer.borderColor = UIColor.red.cgColor
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        let imgBack = UIImage(named: "Grub-X_0054_left-arrow")
                              
        navigationController?.navigationBar.backIndicatorImage = imgBack
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = imgBack
                              
        navigationItem.leftItemsSupplementBackButton = true
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Products"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = .white
      
    }
    
    @IBAction func createBtn(_ sender: Any) {
        
         
        if self.idsArray.count==0 {
                                                
              
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please Select atleast one product") {
                     
                                              
            }
                                                
                                                
                   
        }else{
              
             
            let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                                     
                              
            let vc = storyBoard.instantiateViewController(withIdentifier: "ProceedViewController") as! ProceedViewController
             
            vc.nameArray=self.sendData
              
            vc.countArray=self.countData
             
            vc.priceArrayList=self.priceArray
             
            vc.finalIdsArray=self.idsArray
       
            print(self.idsArray)
       
            print(self.countData)
                            
            self.navigationController?.pushViewController(vc, animated: true)
        
        }
        
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
                           
                for data in resultdata {
                              
                    self.CatalogueProducts.append(data)
                           
                }
                        
                print(self.CatalogueProducts)
                        
                self.collView.reloadData()
                       
            }
                   
        }
          
      
      }
    
    
    @IBAction func onCreateBtnTap(_ sender: Any) {
        
        
//        print(self.sendData)
//
//        print(self.countData)
//
//        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
//
//                           let vc = storyBoard.instantiateViewController(withIdentifier: "ProceedViewController") as! ProceedViewController
//        vc.nameArray=self.sendData
//        vc.countArray=self.countData
//        vc.priceArrayList=self.priceArray
//                           self.navigationController?.pushViewController(vc, animated: true)
        
        
        
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
