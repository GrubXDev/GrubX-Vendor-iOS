//
//  SwitchTableviewcell.swift
//  Grub X Vender
//
//  Created by Mahesh on 11/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
//presentcodevamsi
class SwitchTableviewcell: UITableViewCell {
var unchecked = true
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    @IBOutlet weak var editBtn: UIButton!
    
    @IBOutlet weak var radioBtn: DLRadioButton!
    
    
    
    @IBOutlet weak var businessLbl: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func radioTap(_ sender: Any) {
        if unchecked {
            //radioBtn.setImage(UIImage(named:"Grub-X_0032_check-mark-copy-2"), for: .normal)
            radioBtn.indicatorColor=UIColor(red: 203/255, green: 8/255, blue: 22/255, alpha: 1.0)
           //changeNameServerCall()
               unchecked = false
           }
           else {
           // radioBtn.setImage( UIImage(named:"Grub-X_0031_Layer-5-copy-2"), for: .normal)
            radioBtn.isSelected=false
               unchecked = true
           }
        
    }
     
        

//    func changeNameServerCall(){
//                    let login = UserDefaults.standard.object(forKey: "LoginID")
//        print(login)
//                     let businessid = UserDefaults.standard.object(forKey: "userBusinessId")
//        print(businessid)
//                        var token =  UserDefaults.standard.object(forKey: "Token") as! String
//        print(token)
//                      let header = ["Accept" : "application/json","Authorization" : "Bearer \(token)"]
//                Alamofire.request("http://grubx.myappsdevelopment.com/api/switchbusiness/\(businessid!)/\(login!)", method: .put, encoding: JSONEncoding.default, headers: header)
//                    .responseJSON { response in
//                        print(response.request as Any)  // original URL request
//                        print(response.response as Any) // URL response
//                        print(response.result.value as Any)// result of response serialization
//                        
//                        let statusCode = response.response?.statusCode
//                        
//                        if statusCode == 200{
//                            
//                            do{
//                                if let json = try JSONSerialization.jsonObject(with: response.data!, options:.allowFragments) as? [String: Any]{
//                                    
//                                    print(json)
//                                    let success = json["message"] as! String
//                                    if success == "Switch Business activated successfully"{
//                                        let alert = UIAlertController(title: "Switch Business", message: "Do You Want Add SwitchBusiness?", preferredStyle: .alert)
//                                               
//                                               
//                                        alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: { (confirmAction) in
//                                               
//                                        UserDefaults.standard.removePersistentDomain(forName:Bundle.main.bundleIdentifier!)
//                                                       UserDefaults.standard.synchronize()
//                                               
//                                       // let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
//                                               
//                                      //  self.navigationController?.pushViewController(vc!, animated: true)
//                                               
//                                                   //SingleToneClass.shared.dismissProgressLoadingWithSucess(message: "LogOut Successful")
//                                               
//                                                       //SingleToneClass.shared.dismissProgressLoading(WithDelay: 5)
//                                               
//                                        }))
//                                               
//                                        alert.addAction(UIAlertAction(title: "No", style: .default, handler: { (cancelAction) in }))
//                                               
//                                       // present(alert, animated: true, completion: nil)
//                                        
//                                    
//                                        
//                                        
//                                    }
//                                }
//                                  
//                            } catch {
//                                print(error.localizedDescription)
//                            }
//                        }
//                        
//                }
//                
//        }
                    
                   // let updateNameStr = "user/update_name"
                    
                  //  let userTokenStr = userDefaults.string(forKey: "userToken")!
                    
                   // let header_str = userTokenStr as String
                    
                   // var token =  UserDefaults.standard.object(forKey: "Token") as! String
                    
                   // let param = ["lst_nm": ""]
                    
        //            let headers: HTTPHeaders = [
        //                "X-User-Token": header_str,
        //                "Authorization" : "Bearer \(token)"
        //            ]
                   // let header = ["Accept" : "application/json","Authorization" : "Bearer \(token)"]
                    
//                    Alamofire.request("http://grubx.myappsdevelopment.com/api/switchbusiness/\(businessid!)\(login!)", method: .put, encoding: JSONEncoding.default, headers: header)
//
//                                .responseJSON { response in
//                                    print(response)
//                                    print("http://grubx.myappsdevelopment.com/api/switchbusiness/\(businessid!)\(login!)")
//                                    print(response.request as Any)  // original URL request
//                                    print(response.response as Any) // URL response
//                                    print(response.result.value as Any)// result of response serialization
//
//                                    let statusCode = response.response?.statusCode
//
//                                    if statusCode == 200{
//
//                                        do{
//                                            if let json = try JSONSerialization.jsonObject(with: response.data!, options:.allowFragments) as? [String: Any]{
//
//                                               // print(json)
//
//                                            }
//
//                                        } catch {
//                                            print(error.localizedDescription)
//                                        }
//                                    }
//
//                            }
                            
                    }
                    
            
        
       



