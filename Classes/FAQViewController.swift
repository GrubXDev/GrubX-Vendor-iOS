//
//  FAQViewController.swift
//  Grub X Vender
//
//  Created by MAD-MAC on 18/03/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import KRProgressHUD

class FAQViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    

    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var table: UITableView!
    
    
    var succesStatus:Int!
    var messageStatus:String!
    var errorStatus:String!
    
    
    var questionsArray = [String]()
    var answersArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        faqs()
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
       
        
       
        let imgBack = UIImage(named: "Grub-X_0054_left-arrow")
                              
        navigationController?.navigationBar.backIndicatorImage = imgBack
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = imgBack
                              
        navigationItem.leftItemsSupplementBackButton = true
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
           self.navigationController?.isNavigationBarHidden = false
           self.tabBarController?.tabBar.isHidden = true
           self.navigationItem.title = "Help & Support"
           self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
           self.navigationController?.navigationBar.tintColor = .white
           self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
           self.navigationController?.navigationBar.isTranslucent = false
           self.navigationController?.view.backgroundColor = .white
    
          
    
    }
         
    
    
    
    

    @IBAction func chatBtn(_ sender: Any) {
        
        
        
        
    }
    
    
    
    @IBAction func callBtn(_ sender: Any) {
        
        
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
        return questionsArray.count
      
    }
       
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FAQsTableViewCell
          
        cell.questionLbl.text = questionsArray[indexPath.row]
          
        cell.answerLbl.text = answersArray[indexPath.row]
          
        return cell
     
    }
    
    
    func faqs(){
        
           
                   
        let parameters = ["question":search.text ?? "","type":"1"] as [String : Any]
                
                          
        KRProgressHUD.show()
                            
        Service.shared.POSTService(serviceType:API.faqs, parameters: parameters as [String : Any]) { (response) -> (Void) in
                                
            KRProgressHUD.dismiss()
                                
            print(response)
                                
            let responseDic = response.dictionary
                                
            let result=responseDic!["message"]?.string
                                
            let successMsg = responseDic?["success"]?.int
                                 
            self.succesStatus = successMsg
                            
            if self.succesStatus == 1{
                              
                let data = responseDic?["data"]?.array
              
                
                for i in data! {
                    
                    let question = i["question"].string
                    let answer = i["answer"].string
                 
                    print(question as Any)
                         
                    self.questionsArray.append(question ?? "")
                    self.answersArray.append(answer ?? "")
                }
                
          
                self.table.reloadData()
                
                
                self.view.makeToast(result ?? "failed", duration: 1.0, position: .center)
                                       
                                 
            }else{

                                    
                KRProgressHUD.dismiss()

                                    
                self.view.makeToast(result ?? "failed", duration: 1.0, position: .center)
                                 
            }


                             
        }

        
    }
    
}
