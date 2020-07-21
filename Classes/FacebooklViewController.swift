//
//  FacebooklViewController.swift
//  Grub X Vender
//
//  Created by Arun Reddy on 02/03/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FacebookCore
import FacebookLogin

class FacebooklViewController: UIViewController,LoginButtonDelegate {
//    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
//        <#code#>
//    }
    
  var t = "vamsi"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden=false
       let loginButton = FBLoginButton()
         loginButton.center = view.center
         loginButton.delegate = self // Remember to set the delegate of the loginButton
        
         view.addSubview(loginButton)
         if (AccessToken.current != nil) {
             print(t)
             GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                
                            if (error == nil){
                                //everything works print the user data
                                print(result)
                                 var logInRef = TabBarViewController()
                                logInRef = self.storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
                                           
                                           self.present(logInRef, animated:  true, completion: {
                                               
                                           })
                    
                            }
                        })
                    }  // Do any additional setup after loading the view.
    }
    

     func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
            var logInRef = LoginViewController()

            logInRef = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController

            self.present(logInRef, animated:  true, completion: {

            })
        }
        
        
        
        func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
            var logInRef = TabBarViewController()

            let r = GraphRequest(graphPath: "me", parameters: ["fields":"email,name"], tokenString: AccessToken.current?.tokenString, version: nil, httpMethod: HTTPMethod(rawValue: "GET"))

                   r.start(completionHandler: { (test, result, error) in
                       if(error == nil)
                       {
                           print(result)
                       }
                   })
            print(result)
           // print(r)
            logInRef = self.storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController

            self.present(logInRef, animated:  true, completion: {

            })
        }
        
}
