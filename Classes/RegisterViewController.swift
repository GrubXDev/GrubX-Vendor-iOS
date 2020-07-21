//
//  RegisterViewController.swift
//  Grub X Vender
//
//  Created by vamsikrishna on 23/01/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import KRProgressHUD

class RegisterViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var success:Int!
  //var imagePickerController = UIImagePickerController()
    
    @IBOutlet weak var userPicImage: UIImageView!
    @IBOutlet weak var nameTextfield: TextField!
    @IBOutlet weak var conformPasswordTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: TextField!
    @IBOutlet weak var mobileNoTF: TextField!
    @IBOutlet weak var userNameTF: TextField!
    
    @IBOutlet weak var registerBtn: UIButton!
    var imageUrl:Data?
    
    @IBAction func imagePic(_ sender: Any) {
        let picker = UIImagePickerController()
                      picker.delegate = self
                      picker.sourceType = .photoLibrary
                      present(picker, animated: true, completion: nil)
                     // print("Hello")
        
    }
    
    
    
    @IBAction func registerTap(_ sender: Any) {
        
     if nameTextfield.text?.count==0 {
                                           
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter fullname") {
                self.nameTextfield.becomeFirstResponder()
                                           }
                                           
                                           
                } else if userNameTF.text?.count==0 {
                                           
                SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter username") {
                self.userNameTF.becomeFirstResponder()
                                           }
                                           
                                       }
            else if mobileNoTF.text!.count <= 9 {
                                       
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter valid mobilenumber") {
            self.mobileNoTF.becomeFirstResponder()
                                       }
                                       
                                   }
            else if emailTF.text?.count==0 {
                                       
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter email") {
            self.emailTF.becomeFirstResponder()
                                       }
                                       
                                   }
            else if passwordTF.text?.count==0 {
                                       
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter Password") {
            self.passwordTF.becomeFirstResponder()
                                       }
                                       
                                   }
            else if conformPasswordTF.text?.count==0 {
                                       
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Please enter conform password") {
            self.conformPasswordTF.becomeFirstResponder()
                                       }
                                       
                                   } else {
                                    
                                          registerApiCall()
                                     }
                   
            

        }
    
    
    override func viewWillAppear(_ animated: Bool) {
       
         
        
        let imgBack = UIImage(named: "Grub-X_0054_left-arrow")
                              
        navigationController?.navigationBar.backIndicatorImage = imgBack
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = imgBack
                              
        navigationItem.leftItemsSupplementBackButton = true
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
        self.navigationController?.isNavigationBarHidden = false
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 24/255, green: 39/255, blue: 69/255, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = .white
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        registerBtn.layer.cornerRadius = 10
        
        if SingleToneClass.shared.isInternetAvailable()==false{
                               
            SingleToneClass.shared.showValidationAlert(target: self, title: "Alert", message:  "Please check your internet connection") {
                                     
                               
            }
                            
        }
        userPicImage.layer.cornerRadius =  userPicImage.bounds.size.width / 2
                      self.userPicImage.clipsToBounds = true
        

        // Do any additional setup after loading the view.
    }
//    func uploadImage() {
//
//          userPicImage.alpha = 0.5
//
//           let imageData:NSData = userPicImage.image!.jpeg(.medium)! as NSData
//          let imageStr = imageData.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
//
//         // imageUrl  = imageStr
//    }
    
      func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
            picker.dismiss(animated: true, completion: nil)
            guard let image = info[.originalImage] as? UIImage else {
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
            }
            print(image)
          
        userPicImage.image=image
    
            userPicImage.layer.cornerRadius =  userPicImage.bounds.size.width / 2
            self.userPicImage.clipsToBounds = true
                    let imageData = image.jpegData(compressionQuality: 0.8)
                imageUrl = imageData
            
        }
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//          let tempImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
//          self.userPicImage.image = tempImage
//          self.dismiss(animated:true) {
//              self.uploadImage()
//          }
//
//      }
    
    func registerApiCall(){
        var parameters = ["name":nameTextfield.text!,"email":emailTF.text!,"password":passwordTF.text!,"c_password":conformPasswordTF.text!,"phone":mobileNoTF.text!,"type":"4","user_name":userNameTF.text!,"img_url":imageUrl] as [String : Any]
        KRProgressHUD.show(withMessage: "please wait") {

                                        }
                if let data = imageUrl{
                    parameters["img_url"] = AGImageInfo(fileName: "file.jpeg", type: .png, data: data)
                    
                }
       // KRProgressHUD.show()
      //  print(parameters)
         Service.shared.makeUploadRequest2(serviceType: API.register, parameters: parameters) { response in
                    print(response)
                         KRProgressHUD.dismiss()
                    
            guard let success = response.dictionary else {return}
                               
            if success["message"]!.string! == "User register successfully."{
                    
                               
                KRProgressHUD.dismiss()
                                
                SingleToneClass.shared.showValidationAlert(target: self, title: "success !", message: "User Registered Successfully") {
                               
                    let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
                                
                    let gotoOTP = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                               
                    self.navigationController?.pushViewController(gotoOTP, animated: true)
                               
                }
                    
                              
            }else{
                                   
                KRProgressHUD.dismiss()
                               
                SingleToneClass.shared.showValidationAlert(target: self, title: "Alert !", message: "Validation error.") {
                    
                                            
                }
                    
                                
            }
                    

        }

        
    }






}

extension UIImage {
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    
    func jpeg(_ jpegQuality: JPEGQuality) -> Data? {
        return jpegData(compressionQuality: jpegQuality.rawValue)
    }
}
extension MultipartFormData {
var timestamp: String {
    return "\(NSDate().timeIntervalSince1970 * 1000)"
}

func parameter(with parameters: Parameters){
    for param in parameters {
        if let agImageInfo = param.value as? AGImageInfo {
            append(agImageInfo.data, withName: param.key, fileName: agImageInfo.fileName, mimeType: agImageInfo.type.rawValue)
        }
        else{
            
            if let str = param.value as? String, let convertedValue = str.data(using: String.Encoding.utf8) {
                append(convertedValue, withName: param.key)
            }
            else if let number = param.value as? NSNumber, let data = "\(number)".data(using: String.Encoding.utf8){
                append(data, withName: param.key)
            }
            else if let data = (param.value as AnyObject).data(using: String.Encoding.utf8.rawValue) {
                append(data, withName: param.key)
            }
            else{
                append("\(param.value)".data(using: String.Encoding.utf8)!, withName: param.key)
            }
        }
    }
}}
struct AGImageInfo {
    var fileName: String
    var type: AGContentMIME
    var data: Data
}
enum AGContentMIME: String {
    case png = "image/png"
    case video = "mov"
    case pdf = "pdf"
    
}

struct AGImageUpdate {
    var fileName: String
    var type: String
    var data: Data
}
