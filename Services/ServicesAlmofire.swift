//
//  ServicesAlmofire.swift
//  Grub X Vender
//
//  Created by Mahesh on 10/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class Service{
    var tokens:String!
    static let shared = Service()
    
    init() {}
    
    func PutService(extraParam : String, onTaskCompleted : @escaping (JSON)->(Void) ) {
        //get service
          var token =  UserDefaults.standard.object(forKey: "Token") as! String
        let header = ["Accept" : "application/json","Authorization" : "Bearer \(token)"]
        print(extraParam)
        guard let url = URL(string: "\(extraParam)") else { return }
        
        Alamofire.request(url, method: .put,encoding:JSONEncoding.default, headers: header).responseJSON
            { response in
                
                print(response)
                
                let jsonData = JSON(response.result.value as Any)
                onTaskCompleted(jsonData)
        }
    }
    
    
//    func POSTService(serviceType : String,parameters : [String:String], onTaskCompleted : @escaping (JSON)->(Void)) {
//        //post service
//        let header = ["Content-Type" : "application/json"]
//        print(serviceType)
//        guard let url = URL(string: "\(serviceType)") else { return }
//        print(parameters)
//        Alamofire.request(url, method: .post, parameters: parameters,headers: header).responseJSON{ response in
//        print(response)
//            let jsonData = JSON(response.result.value as Any)
//            onTaskCompleted(jsonData)
//
//        }
//    }
    func POSTService(serviceType : String,parameters : [String:Any], onTaskCompleted : @escaping (JSON)->(Void)) {
        print(serviceType)
        guard let url = URL(string: "\(serviceType)") else { return }
      //  print(parameters)
        
        var token =  UserDefaults.standard.object(forKey: "Token") as! String
      
        
         let header = ["Accept" : "application/json","Authorization" : "Bearer \(token)"]
        //        Alamofire.request(url, method: .post, parameters: parameters,headers: header).responseJSON{ response in
        
        Alamofire.request(url, method: .post, parameters: parameters,encoding:URLEncoding.default, headers: header).responseJSON{ response in
            
            switch response.result {
            case .success(let value):
                let jsonData = JSON(response.result.value as Any)
                onTaskCompleted(jsonData)

            case .failure(let error):
                debugPrint(error.localizedDescription)
//                SingleToneClass.shared.dismissProgressLoadingWithError(message: "Server problem")
//                SingleToneClass.shared.dismissProgressLoading(WithDelay: 5)
            }
            print(response)
            
        }
    }
    func GETCallService(serviceType : String, onTaskCompleted : @escaping (JSON)->(Void)) {
            print(serviceType)
            guard let url = URL(string: "\(serviceType)") else { return }
           
            
            var token =  UserDefaults.standard.object(forKey: "Token") as! String
          
            
             let header = ["Accept" : "application/json","Authorization" : "Bearer \(token)"]
            //        Alamofire.request(url, method: .post, parameters: parameters,headers: header).responseJSON{ response in
            
            Alamofire.request(url, method: .get,encoding:URLEncoding.default, headers: header).responseJSON{ response in
                
                switch response.result {
                case .success(let value):
                    let jsonData = JSON(response.result.value as Any)
                    onTaskCompleted(jsonData)

                case .failure(let error):
                    debugPrint(error.localizedDescription)
    //                SingleToneClass.shared.dismissProgressLoadingWithError(message: "Server problem")
    //                SingleToneClass.shared.dismissProgressLoading(WithDelay: 5)
                }
                print(response)
                
            }
        }
    func PUTCallService(serviceType : String, onTaskCompleted : @escaping (JSON)->(Void)) {
               print(serviceType)
               guard let url = URL(string: "\(serviceType)") else { return }
              
               
               var token =  UserDefaults.standard.object(forKey: "Token") as! String
             
               
                let header = ["Accept" : "application/json","Authorization" : "Bearer \(token)"]
               //        Alamofire.request(url, method: .post, parameters: parameters,headers: header).responseJSON{ response in
               
               Alamofire.request(url, method: .put,encoding:URLEncoding.default, headers: header).responseJSON{ response in
                   
                   switch response.result {
                   case .success(let value):
                       let jsonData = JSON(response.result.value as Any)
                       onTaskCompleted(jsonData)

                   case .failure(let error):
                       debugPrint(error.localizedDescription)
       //                SingleToneClass.shared.dismissProgressLoadingWithError(message: "Server problem")
       //                SingleToneClass.shared.dismissProgressLoading(WithDelay: 5)
                   }
                   print(response)
                   
               }
           }
    func POSTServiceWithoutEncoding(serviceType : String,parameters : [String:Any], onTaskCompleted : @escaping (JSON)->(Void)) {
        print(serviceType)
        guard let url = URL(string: "\(serviceType)") else { return }
       // print(parameters)
         //var accessToken = UserDefaults.standard.object(forKey:"access_token") as! String
        var token =  UserDefaults.standard.object(forKey: "Token") as Any
        let header = ["Accept" : "application/json","Authorization" : "Bearer \(token)"]
        
        Alamofire.request(url, method: .post, parameters: parameters,encoding:JSONEncoding(options: []), headers: header).responseJSON{ response in
            
            switch response.result {
            case .success(let value):
                let jsonData = JSON(response.result.value as Any)
                onTaskCompleted(jsonData)

            case .failure(let error):
                debugPrint(error.localizedDescription)
//                SingleToneClass.shared.dismissProgressLoadingWithError(message: "Server problem")
               // SingleToneClass.shared.dismissProgressLoading(WithDelay: 5)
            }
            print(response)
            
        }
    }
    
    func GETService2(extraParam : String, onTaskCompleted : @escaping (JSON)->(Void) ) {
           
           //get service
         var token =  UserDefaults.standard.object(forKey: "Token") as! String
           let header = ["Accept" : "application/json","Authorization" : "Bearer \(token)"]
            
             
           print(extraParam)
           guard let url = URL(string: "\(extraParam)") else { return }
           
           Alamofire.request(url, method: .get,encoding:JSONEncoding.default, headers: header).responseJSON
               { response in
                   
                   print(response)
                   
                   let jsonData = JSON(response.result.value as Any)
                   onTaskCompleted(jsonData)
           }
       }
    
    
    
    
    
    
    
    
    func POSTServiceWithEncoding(serviceType : String,parameters : [String:String], onTaskCompleted : @escaping (JSON)->(Void)) {
              print(serviceType)
              guard let url = URL(string: "\(serviceType)") else { return }
              print(parameters)
              // var accessToken = UserDefaults.standard.object(forKey:"access_token") as! String
              
              let header = ["Content-Type" : "application/json"]
                    
              
        Alamofire.request(url, method: .post, parameters: parameters,encoding:URLEncoding.httpBody, headers: header).responseJSON{ response in
                  
                  switch response.result {
                  case .success(let value):
                      let jsonData = JSON(response.result.value as Any)
                      onTaskCompleted(jsonData)

                  case .failure(let error):
                      debugPrint(error.localizedDescription)
//                      SingleToneClass.shared.dismissProgressLoadingWithError(message: "Server problem")
                     // SingleToneClass.shared.dismissProgressLoading(WithDelay: 5)
                  }
                  print(response)
                  
              }
          }
    
   
    
    
    func POSTServiceWithArray(serviceType : String,parameters : [[String:String]], onTaskCompleted : @escaping (JSON)->(Void)) {
          print(serviceType)
          guard let url = URL(string: "\(serviceType)") else { return }
          print(parameters)
          // var accessToken = UserDefaults.standard.object(forKey:"access_token") as! String
          
          let header = ["Content-Type" : "application/json"]
        var request=URLRequest(url: url)
        request.httpBody=try! JSONSerialization.data(withJSONObject: parameters)
        request.httpMethod="POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        Alamofire.request(request)
            .responseJSON { response in
                // do whatever you want here
                switch response.result {
                case .failure(let error):
                    print(error.localizedDescription)

                    if let data = response.data, let responseString = String(data: data, encoding: .utf8) {
                        print(responseString)
                    }
                case .success(let responseObject):
                    print(responseObject)
                    let jsonData = JSON(response.result.value as Any)
                    onTaskCompleted(jsonData)
                }
        }

      }
    
    
    
    
    
    
    
    func showValidationAlert(target : UIViewController, title : String, message : String, OntapOkButton : @escaping (() -> Void))  {
        //alert
        
        let emailAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel) { (okayAction) in
          
            OntapOkButton()
           
        }
        
        emailAlert.addAction(okAction)
        
        DispatchQueue.main.async {
            
            target.present(emailAlert, animated: true, completion: nil)
            
        }
        
    }
    
    func makeUploadRequest(serviceType : String,parameters : [String:Any], completion: @escaping (JSON) -> ()) {
          // var token =  UserDefaults.standard.object(forKey: "Token") as! String
           
             var token =  UserDefaults.standard.object(forKey: "Token") as! String
             let header = ["Accept" : "application/json","Authorization" : "Bearer \(token)"]
              //let header = ["Accept" : "application/json",""]
           guard let url = URL(string: "\(serviceType)") else { return }
           
           let manager = Alamofire.SessionManager.default
           manager.session.configuration.timeoutIntervalForRequest = 180
           
           manager.upload(multipartFormData: { multipartFormData in
               multipartFormData.parameter(with: parameters)
               
           }, to: url, method: .post, headers:header, encodingCompletion: { encodingResult in
               
               switch encodingResult {
               case .success(let request, _,_ ):
                   request.responseJSON(completionHandler: { (response) in
                       switch response.result {
                       case .success(let value):
                           let jsonData = JSON(response.result.value as Any)
                           completion(jsonData)
                           print(jsonData)
                       case .failure(let error):
                           debugPrint(error.localizedDescription)
                       }
                   })
                   
                   request.uploadProgress(closure: { (progress) in
                       print("Upload Progress: \(progress.fractionCompleted)")
                   })
                   
               case .failure(let error):
                   debugPrint(error.localizedDescription)
                   break
               }
           })
       }
    
    
    func makeUploadRequest2(serviceType : String,parameters : [String:Any], completion: @escaping (JSON) -> ()) {
             // var token =  UserDefaults.standard.object(forKey: "Token") as! String
              
              //  var token =  UserDefaults.standard.object(forKey: "Token") as! String
                let header = ["Accept" : "application/json"]
                 //let header = ["Accept" : "application/json",""]
              guard let url = URL(string: "\(serviceType)") else { return }
              
              let manager = Alamofire.SessionManager.default
              manager.session.configuration.timeoutIntervalForRequest = 180
              
              manager.upload(multipartFormData: { multipartFormData in
                  multipartFormData.parameter(with: parameters)
                  
              }, to: url, method: .post, headers:header, encodingCompletion: { encodingResult in
                  
                  switch encodingResult {
                  case .success(let request, _,_ ):
                      request.responseJSON(completionHandler: { (response) in
                          switch response.result {
                          case .success(let value):
                              let jsonData = JSON(response.result.value as Any)
                              completion(jsonData)
                              print(jsonData)
                          case .failure(let error):
                              debugPrint(error.localizedDescription)
                          }
                      })
                      
                      request.uploadProgress(closure: { (progress) in
                          print("Upload Progress: \(progress.fractionCompleted)")
                      })
                      
                  case .failure(let error):
                      debugPrint(error.localizedDescription)
                      break
                  }
              })
          }
}
