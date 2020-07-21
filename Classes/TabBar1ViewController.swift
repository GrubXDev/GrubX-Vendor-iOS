//
//  TabBar1ViewController.swift
//  Grub X Vender
//
//  Created by MAD-MAC on 05/03/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class TabBar1ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    @IBOutlet weak var table: UITableView!
    
     var categoryArray=["Bakery Goods and sweets","Meat and Poultry","Beverages and Drinks","Fruits and Vegetables","Restaurants And Supplies"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

         tabBarController?.selectedIndex = 2
        // Do any additional setup after loading the view.
    }
    

    
     
    override func viewWillAppear(_ animated: Bool) {
                 
          
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Catalogues"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
                        
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = .white
   
            
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TabBar1TableViewCell
        
        cell.shadowView.layer.cornerRadius = 01
        cell.shadowView.layer.masksToBounds = false
        cell.shadowView.layer.shadowColor = UIColor.black.cgColor
        cell.shadowView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        cell.shadowView.layer.shadowOpacity = 0.5
        cell.categoryNameLbl.text=self.categoryArray[indexPath.row]
        
        return cell
        
    }
  
}
