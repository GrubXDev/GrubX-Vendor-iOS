//
//  CatalogueViewController.swift
//  Grub X Vender
//
//  Created by Ashish dattu on 25/01/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class CatalogueViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    

    
    @IBOutlet weak var table: UITableView!
    
    
    var imagesArray = [#imageLiteral(resourceName: "goods-icon"),#imageLiteral(resourceName: "meat-icon"),#imageLiteral(resourceName: "wine-icon"),#imageLiteral(resourceName: "grocery-icon"),#imageLiteral(resourceName: "fruite-icon"),#imageLiteral(resourceName: "supply-icon")]
    var namesArray = ["Baked Goods & Sweets","Meat & Poultry","Beverages","Grocery & Pantry","Fruits and Vegetables","Takeout Supplies"]
    
    override func viewWillAppear(_ animated: Bool) {
                
         
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        
       // self.navigationItem.title = "Dashboard"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = .white
              
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for:[])


      
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if SingleToneClass.shared.isInternetAvailable()==false{
                                 
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message:  "Please check your internet connection") {
                                     
                                
            }
                            
        }
        tabBarController?.selectedIndex = 2
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CatalogueTableViewCell
        
        
        cell.cellView.layer.masksToBounds = false
        cell.cellView.layer.shadowColor = UIColor.black.cgColor
        cell.cellView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        cell.cellView.layer.shadowOpacity = 0.5
        
        cell.imageIcons.image = imagesArray[indexPath.row]
        cell.namesLbl.text = namesArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProductsViewController") as! ProductsViewController
             
        vc.product = "1"
        navigationController?.pushViewController(vc, animated: true)
    }

    

}
