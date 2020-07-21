//
//  LoginViewController.swift
//  Grub X Vender
//
//  Created by vamsikrishna on 22/01/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import Alamofire
import KRProgressHUD
import AlamofireObjectMapper
import GoogleSignIn


class LoginViewController: UIViewController,GIDSignInDelegate,GIDSignInUIDelegate {
    
    var succesStatus:Int!
    var messageStatus:String!
    var errorStatus:String!
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    //  @IBOutlet weak var requestOtpBtn: UIButton!
    
  var userId = String()                 // For client-side use only!
  var idToken = String() // Safe to send to the server
  var fullName = String()
  var givenName = String()
  var familyName = String()
  var email = String()
  var imageUrl = NSURL()
  var sendGoogleDatadic = NSDictionary()
  var sendFbDataDIC = NSDictionary()
    
    var baseUrl = "http://grubx.srimaruthienterprises.in/storage/cover_images/"
    
    let grayColour = UIColor(red: 143.0/255.0, green: 143.0/255.0, blue: 143.0/255.0, alpha: 1.0)
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    @IBAction func loginClick(_ sender: Any) {
        if emailTF.text?.count==0 {
                                    
                                 
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter Username") {
                                      
                self.emailTF.becomeFirstResponder()
                
            }
                                    
                                    
            
        } else if passwordTF.text?.count==0 {
                                    
        
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter password") {
            
                self.passwordTF.becomeFirstResponder()
                
            }
            
            
            
        } else {
                             
                              
            loginApiCall()
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTF.text="vikas@gmail.com"
        passwordTF.text="123456"
        if SingleToneClass.shared.isInternetAvailable()==false{

            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message:  "Please check your internet connection") {
                              
            
            }
            
        }
        
        loginBtn.layer.cornerRadius = 10
        loginBtn.layer.borderWidth = 1
        loginBtn.layer.borderColor = UIColor.gray.cgColor
        
       GIDSignIn.sharedInstance().uiDelegate = self
       GIDSignIn.sharedInstance().delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func forgotBtn(_ sender: Any) {
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let gotoOTP = storyBoard.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        self.navigationController?.pushViewController(gotoOTP, animated: true)
        
        
    }
    
    
    @IBAction func continueAsEmployee(_ sender: Any) {
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let gotoOTP = storyBoard.instantiateViewController(withIdentifier: "ContinueAsGuestViewController") as! ContinueAsGuestViewController
        self.navigationController?.pushViewController(gotoOTP, animated: true)
        
        
        
    }
    
    
    @IBAction func requestOtpBtn(_ sender: Any) {
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let gotoOTP = storyBoard.instantiateViewController(withIdentifier: "RequestOTPViewController") as! RequestOTPViewController
        self.navigationController?.pushViewController(gotoOTP, animated: true)
    }
    
    
    
    @IBAction func faceBookBtn(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let gotoOTP = storyBoard.instantiateViewController(withIdentifier: "FacebooklViewController") as! FacebooklViewController
        self.navigationController?.pushViewController(gotoOTP, animated: true)
                        
        
    }
    
    @IBAction func gmailBtn(_ sender: Any) {
        GIDSignIn.sharedInstance().delegate=self
        GIDSignIn.sharedInstance().signIn()
    }
    
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
                if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        // Perform any operations on signed in user here.
        let userId = user.userID                  // For client-side use only!
        let idToken = user.authentication.idToken // Safe to send to the server
        let fullName = user.profile.name
        let givenName = user.profile.givenName
        let familyName = user.profile.familyName
        let email = user.profile.email
        
        
        self.userId = user.userID                  // For client-side use only!
        self.idToken = user.authentication.idToken // Safe to send to the server
        self.fullName = user.profile.name
        self.givenName = user.profile.givenName
        //self.familyName = user.profile.familyName
        self.email = user.profile.email
        self.imageUrl = user.profile.imageURL(withDimension: 120)! as NSURL
        
        print("userID:\(String(describing: userId))")
        print("idToken:\(String(describing: idToken))")
        print("fullName:\(String(describing: fullName))")
        print("givenName:\(String(describing: givenName))")
        print("familyName:\(String(describing: familyName))")
        print("email:\(String(describing: email))")
        
        sendGoogleDatadic = ["email": email ?? "", "id": userId ?? "", "image_url":"\(String(describing: imageUrl))", "name": givenName as Any, "fullName": self.fullName, "familyName": self.familyName] as NSDictionary
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
       // nextViewController.getGmailUserDic = sendGoogleDatadic
        self.navigationController?.pushViewController(nextViewController, animated: true)

    }
    
    
    
    
    @IBAction func createAnAccountBtn(_ sender: Any) {
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let gotoOTP = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(gotoOTP, animated: true)
    }
    
    func loginApiCall(){
        
        let parameters = ["email":emailTF.text!,"password":passwordTF.text!]
        KRProgressHUD.show()
        Service.shared.POSTServiceWithoutEncoding(serviceType:API.login, parameters: parameters as [String : Any]) { (response) -> (Void) in
            KRProgressHUD.dismiss()
            print(response)
            let responseDic = response.dictionary
            //  UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
            // UserDefaults.standard.synchronize()
            let successMsg = responseDic?["success"]?.int
          
            

            self.succesStatus = successMsg
           

            if self.succesStatus == 1{
               
                let dataDic = responseDic?["data"]?.dictionary
                          
                let userid = dataDic?["users_id"]?.int
                let token = dataDic?["token"]?.string
                let name = dataDic?["name"]?.string
                let image = dataDic?["img_url"]?.string
                let phone = dataDic?["phone"]?.string
                             let email = dataDic?["email"]?.string
                let profileImage = self.baseUrl + (image ?? "")
                
                let business = dataDic?["business"]?.array
                let sample = business?[0].dictionary 
                let businessId = sample?["id"]?.string ?? "no data"
                let businessName = sample?["business_name"]?.string ?? "no data"
                let goods = sample?["goods"]?.string ?? "no data"
                let address = sample?["address"]?.string ?? "no data"
               
               
                
                UserDefaults.standard.set(userid, forKey: "LoginID")
                UserDefaults.standard.set(token, forKey: "Token")
                UserDefaults.standard.set(businessId, forKey: "userBusinessId")
                UserDefaults.standard.set(businessName, forKey: "BusinessName")
                UserDefaults.standard.set(goods, forKey: "goods")
                UserDefaults.standard.set(name, forKey: "Name")
                UserDefaults.standard.set(phone, forKey: "phone")
                UserDefaults.standard.set(email, forKey: "email")
                UserDefaults.standard.set(profileImage, forKey: "profileImage")
                UserDefaults.standard.set(address, forKey: "Address")
                
                DispatchQueue.main.async {
                    

                    let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                        
                    let gotoOTP = storyBoard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
                         
                    self.navigationController?.pushViewController(gotoOTP, animated: true)
               
                }
                
           
            }else{
               
                KRProgressHUD.dismiss()
                SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message: "Please Enter Valid Credintials") {
                    
                }
                
            }
            
            
        }
        
        
        
    }
   
    
}
