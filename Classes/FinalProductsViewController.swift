//
//  FinalProductsViewController.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 27/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class FinalProductsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    var categoryArray=["Bakery Goods and sweets","Meat and Poultry","Beverages and Drinks","Fruits and Vegetables","Restaurants And Supplies"]
    
    
    
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return self.view.frame.height
//    }
    

    @IBOutlet weak var tblView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
             
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Products Categories"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
                    
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = .white
                    
//                 UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for:[])
          }
          
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FinalProductsTableViewCell
        
        cell.shadowView.layer.cornerRadius = 01
        cell.shadowView.layer.masksToBounds = false
        cell.shadowView.layer.shadowColor = UIColor.black.cgColor
        cell.shadowView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        cell.shadowView.layer.shadowOpacity = 0.5
        cell.categoryNameLbl.text=self.categoryArray[indexPath.row]
        
        return cell
        
    }
    
  
}
