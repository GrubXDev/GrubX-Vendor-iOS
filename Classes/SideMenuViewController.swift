//
//  SideMenuViewController.swift
//  Grub X Vender
//
//  Created by Ashish dattu on 25/01/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import Kingfisher
import GoogleSignIn
import FBSDKCoreKit
import FBSDKLoginKit


var pathofpic:String?


class SideMenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
var shareContent:String = "Grubx App Store Link here for installing the app"
    @IBOutlet weak var namesLbl: UILabel!
    @IBOutlet weak var nameLbl2: UILabel!
    @IBOutlet weak var cellNoLbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
  
    var namesArray = ["Home","Products","Add Products","Business","Add Business","My Favourites","My Account","Special Catalogue","Place Order","Placed Orders","Invite","Contact Us"]
    
    override func viewWillAppear(_ animated: Bool) {
    
        self.navigationController?.isNavigationBarHidden = true
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.namesLbl.text = UserDefaults.standard.object(forKey: "BusinessName") as? String
        self.nameLbl2.text = UserDefaults.standard.object(forKey: "Name") as? String
        self.cellNoLbl.text = UserDefaults.standard.object(forKey: "Address") as? String
        let profileImages = UserDefaults.standard.object(forKey: "profileImage") as? String
        
        
        pathofpic = profileImages
        
        print(pathofpic as Any)


        if let imageUrl = pathofpic{
                    
                    
            let url = URL(string: imageUrl)
                           
            print(url as Any)
                                         
            self.profileImage.kf.setImage(with: url)

        }
        
        profileImage.layer.cornerRadius =  profileImage.bounds.size.width / 2
        self.profileImage.clipsToBounds = true
        
        
        
        
//         let picture = UserDefaults.standard.object(forKey: "ProfileImage") as? String
//
//        let imageRes = ImageResource(downloadURL: URL(string: picture ?? "")!)
//                   print(imageRes)
//
//                   profileImage.kf.setImage(with: imageRes)
                   

                   
               
//        if let imageUrl = pathofpic{
//             let conn="/"
//            let url = URL(string: imageUrl+conn+image)
//                   //print(url)
//                                 self.imgView.kf.setImage(with: url)
//        }
        
        
        
      
        if SingleToneClass.shared.isInternetAvailable()==false{
                                 
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message:  "Please check your internet connection") {
                                     
                                
            }
            
        }
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SideMenuTableViewCell
        
        cell.namesLbl.text = namesArray[indexPath.row]
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
                 
            navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 1 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "ProductsViewController") as! ProductsViewController
                 
            navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 2 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "AddProductViewController") as! AddProductViewController
                            
            navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 3 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "SwitchViewController") as! SwitchViewController
                            
            navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 4 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "AddBusinessViewController") as! AddBusinessViewController
            vc.business = "1"
            navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 5 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "MyFavoriteViewController") as! MyFavoriteViewController
                            
            navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 6 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
                            
            navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 7 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "SpecialCatalogueViewController") as! SpecialCatalogueViewController
                            
            navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 8 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "PlaceOrderViewController") as! PlaceOrderViewController
                            
            navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 9 {
            let vc = storyboard?.instantiateViewController(withIdentifier: "PlacedOrdersViewController") as! PlacedOrdersViewController
                            
            navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 10 {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "InviteScreenViewController") as! InviteScreenViewController
                                       
                       navigationController?.pushViewController(vc, animated: true)
            
//           let textShare = [ shareContent ]
//           let activityViewController = UIActivityViewController(activityItems: textShare , applicationActivities: nil)
//           activityViewController.popoverPresentationController?.sourceView = self.view
//           self.present(activityViewController, animated: true, completion: nil)
        }
        else if indexPath.row == 11 {
            
           let vc = storyboard?.instantiateViewController(withIdentifier: "ContactUsViewController") as! ContactUsViewController
            Constants.contact = false
            navigationController?.pushViewController(vc, animated: true)
            
            
        }
    }
    
    
    
    
}
