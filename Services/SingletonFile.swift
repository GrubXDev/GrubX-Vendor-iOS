//
//  SingletonFile.swift
//  Grub X Vender
//
//  Created by Mahesh on 06/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration


class SingleToneClass:NSObject{
    static let shared = SingleToneClass()
    override init() {
           
       }
       func showValidationAlert(target : UIViewController, title : String, message : String, OntapOkButton : @escaping (() -> Void))  {
              
              let emailAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
              let okAction = UIAlertAction(title: "OK", style: .cancel) { (okayAction) in
                  
                  OntapOkButton()
                  
              }
              emailAlert.addAction(okAction)
              DispatchQueue.main.async {
                  target.present(emailAlert, animated: true, completion: nil)
              }
              
          }
    func isInternetAvailable() -> Bool
       {
           //for checking internet connection
           var zeroAddress = sockaddr_in()
           zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
           zeroAddress.sin_family = sa_family_t(AF_INET)
           
           let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
               $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                   SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
               }
           }
           
           var flags = SCNetworkReachabilityFlags()
           if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
               return false
           }
           let isReachable = flags.contains(.reachable)
           let needsConnection = flags.contains(.connectionRequired)
           return (isReachable && !needsConnection)
       }
          
}
