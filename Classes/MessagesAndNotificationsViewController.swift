//
//  MessagesAndNotificationsViewController.swift
//  Grub X Vender
//
//  Created by Shreyash Shriyam on 02/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class MessagesAndNotificationsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    

    @IBOutlet weak var messagesBtn: UIButton!
    @IBOutlet weak var messagesView: UIView!
    @IBOutlet weak var notificationsBtn: UIButton!
    @IBOutlet weak var notificationsView: UIView!
    @IBOutlet weak var table: UITableView!
    
  
    let grayColour = UIColor(red: 143.0/255.0, green: 143.0/255.0, blue: 143.0/255.0, alpha: 1.0)
    let redColour = UIColor(red: 203.0/255.0, green: 8.0/255.0, blue: 22.0/255.0, alpha: 1.0)
   
    var name1Array = ["Andrea","Customer Support","Jonathon Mathew","Simson"]
    var name2Array = ["Your Product awesome Mate","One Moment Please","This time goods are not good","we need more stock"]
 
    
    
       override func viewWillAppear(_ animated: Bool) {
           
      
                   let imgBack = UIImage(named: "Grub-X_0054_left-arrow")
                              
                   navigationController?.navigationBar.backIndicatorImage = imgBack
                   navigationController?.navigationBar.backIndicatorTransitionMaskImage = imgBack
                              
                   navigationItem.leftItemsSupplementBackButton = true
                   navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
        
           self.navigationController?.isNavigationBarHidden = false
           self.tabBarController?.tabBar.isHidden = false
          // scrollViewDidEndDecelerating(collection)
        self.navigationItem.title = "Notifications"
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
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func messagesBtn(_ sender: Any) {
        
        messagesBtn.setTitleColor(redColour, for: [])
        self.messagesView.backgroundColor = redColour
        notificationsBtn.setTitleColor(grayColour, for: [])
        self.notificationsView.backgroundColor = grayColour
        self.table.reloadData()
        
    }
    
    
    @IBAction func notificationsBtn(_ sender: Any) {
        
        messagesBtn.setTitleColor(grayColour, for: [])
        self.messagesView.backgroundColor = grayColour
        notificationsBtn.setTitleColor(redColour, for: [])
        self.notificationsView.backgroundColor = redColour
        self.table.reloadData()
    }
    
    
    @IBAction func clearChatBtn(_ sender: Any) {
        
        self.table.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
        return name1Array.count
       
    }
       
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MessagesAndNotificationsTableViewCell
        
        return cell
      
    }
    
}
