//
//  SpecialCatalogueViewController.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 26/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import UIKit
import AlamofireObjectMapper
import Alamofire
import KRProgressHUD
import Kingfisher

//var imagepath="http://grubx.srimaruthienterprises.in/storage/"

class SpecialCatalogueViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var imagepath="http://grubx.srimaruthienterprises.in/storage/"
    @IBOutlet weak var comboView: UIView!
    @IBOutlet weak var miniView: UIView!
    @IBOutlet weak var comboBtn: UIButton!
    @IBOutlet weak var miniBtn: UIButton!
    @IBOutlet weak var tblView: UITableView!
    
    var mini=String()
    var miniCatalogueData:[MiniCatalogueData] = []
    
    let grayColour = UIColor(red: 143.0/255.0, green: 143.0/255.0, blue: 143.0/255.0, alpha: 1.0)
        
    let redColour = UIColor(red: 203.0/255.0, green: 8.0/255.0, blue: 22.0/255.0, alpha: 1.0)
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return miniCatalogueData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell=tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SpecialCatalogueTableViewCell
        
      // if let imageUrl = miniCatalogueData[indexPath.row].imgUrl1{
              // let url = URL(string: imagepath+imageUrl)
              //let url = URL(string: path!+conn+categoryData[indexPath.row].imgUrl!)!
             // cell.imageItems.kf.setImage(with: url)
             
       
        var trimmedStr = String()
        var baseUrlStr = String()
        var imgUrlStr = miniCatalogueData[indexPath.row].imgUrl1 as? String
        print(imgUrlStr)
         
        
        if (imgUrlStr?.contains(" "))!{
             
         
            let  trimmedString = imgUrlStr?.replacingOccurrences(of: " ", with: "%20")
             
             
            trimmedStr = trimmedString!
            baseUrlStr = imagepath + (trimmedStr ?? "")
             
        
            print("trimmedStringtrimmedString",trimmedString)
        
        }else{
            
            baseUrlStr = imagepath + (imgUrlStr ?? "")
        
        }
         
         let  url = URL.init(string: baseUrlStr)
         print("URL===========",url )
        /* cell.imgView.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
             if (image != nil){
                 
                 cell.imgView.image = image
                cell.imgView.contentMode = .scaleAspectFit
             }else{
                 cell.imgView.image = UIImage.init(named:"budweisier_1584791337.jpg")
                 
             }
         }*/
        
        cell.imageItems.contentMode = .scaleAspectFit
        cell.imageItems.sd_setImage(with: url, placeholderImage:nil, options: .lowPriority, progress: nil, completed: { (image, error, cacheType, url) in
                    
            if image != nil  {
                       
                cell.imageItems.image = image
                        
                cell.imageItems.contentMode = .scaleAspectFit
                       
            }else{
                        
                cell.imageItems.image = UIImage.init(named:"budweisier_1584791337.jpg")
                                     
                                 
            }
        
        })
       
        cell.catalogueName.text=miniCatalogueData[indexPath.row].name
        cell.catalogueCount.text=miniCatalogueData[indexPath.row].productscount
       // }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mini="1"
        api()
        tblView.reloadData()
        KRProgressHUD.show()
        miniBtn.layer.masksToBounds = false
                                     
        miniBtn.layer.shadowColor = UIColor.lightGray.cgColor
        miniBtn.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        miniBtn.layer.shadowOpacity = 0.5
      
        comboBtn.layer.masksToBounds = false
        comboBtn.layer.shadowColor = UIColor.lightGray.cgColor
        comboBtn.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        comboBtn.layer.shadowOpacity = 0.5

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
                   
            
          
        self.navigationController?.isNavigationBarHidden = false
    
           
        self.navigationItem.title = "Special Catalogue"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = .white
                 
       


         
       }

    @IBAction func onMiniCataloguesBtnTap(_ sender: Any) {
      //  miniBtn.backgroundColor=UIColor.white
        miniBtn.setTitleColor(redColour, for: [])
        
       // comboBtn.backgroundColor=UIColor.lightGray
        comboBtn.setTitleColor(grayColour, for: [])
        
        self.miniView.backgroundColor = redColour
        self.comboView.backgroundColor = grayColour
        
         self.mini="1"
         miniCatalogueData.removeAll()
         KRProgressHUD.show()
         api()
         tblView.reloadData()
        
    }
    
    
    @IBAction func onComoBtnTap(_ sender: Any) {
       
    
        comboBtn.setTitleColor(redColour, for: [])
      
        miniBtn.setTitleColor(grayColour, for: [])
    
       
        self.miniView.backgroundColor = grayColour
        self.comboView.backgroundColor = redColour
        
         self.mini="2"
         miniCatalogueData.removeAll()
         KRProgressHUD.show()
         api()
         tblView.reloadData()
    }
    
    
    @IBAction func onPlusBtnTap(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SpecialCatalogueProductsViewController") as! SpecialCatalogueProductsViewController
                                   
                 
        navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    
    
    func api(){
           
        let userid = UserDefaults.standard.object(forKey: "LoginID") as! Int
           
        let accessToken = UserDefaults.standard.object(forKey: "Token") as! String
                         
        let header = ["Accept" : "application/json","Authorization" : "Bearer \(accessToken)"]
                     
        var conn="/\(userid)/\(mini)"
                  
        Alamofire.request(API.miniCatalogue + conn,headers: header).responseObject { (response: DataResponse<MiniCatalogueModel>) in
           KRProgressHUD.dismiss()
                         
            let initialresponse = response.result.value
                         
                      print(initialresponse)
            if let resultdata = initialresponse?.data {
                        print(resultdata)
                for data in resultdata {
                              
                    self.miniCatalogueData.append(data)
                            
                }
                            
                self.tblView.reloadData()
                        
            }
                     
        }
           
           
           
           
    }
    
    
    
    
}
