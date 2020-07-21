//
//  WebserviceManager.swift
//  Grub X Vender
//
//  Created by Mahesh on 07/02/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import Foundation
import UIKit
extension UIImageView {
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
    
    
}

//class WebServiceManager{
//    
//    static func getRequestDataFromJson(url: String, completion: @escaping (_ success: [String : AnyObject]) -> Void) {
//           var request = URLRequest(url: URL(string: url)!)
//           request.httpMethod = "GET"
//               request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//               request.addValue("application/json", forHTTPHeaderField: "Accept")
//           
//           let task = URLSession.shared.dataTask(with: request) { Data, response, error in
//               guard let data = Data, error == nil else {  // check for fundamental networking error
//                   print("error=\(error)")
//                   return
//               }
//               
//               if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {  // check for http errors
//                   print("statusCode should be 200, but is \(httpStatus.statusCode)")
//                   print(response!)
//                   return
//                   
//               }
//               
//               let responseString  = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : AnyObject]
//               completion(responseString)
//               
//           }
//           task.resume()
//       }
//    static func postDataFromJson(url: String, parameter: [String: AnyObject], completion: @escaping (_ success: [String : AnyObject]) -> Void) {
//           var request = URLRequest(url: URL(string: url)!)
//           request.httpMethod = "POST"
//           let postString = parameter
//           do{
//               request.httpBody = try JSONSerialization.data(withJSONObject: postString, options: .prettyPrinted)
//           }catch let error {
//               print(error.localizedDescription)
//           }
//               request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//               request.addValue("application/json", forHTTPHeaderField: "Accept")
//
//           let task = URLSession.shared.dataTask(with: request) { Data, response, error in
//               guard let data = Data, error == nil else {  // check for fundamental networking error
//                   print("error=\(error)")
//                   return
//               }
//               
//               if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {  // check for http errors
//                   print("statusCode should be 200, but is \(httpStatus.statusCode)")
//                   print(response!)
//                   return
//                   
//               }
//               
//               let responseString  = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String : AnyObject]
//               completion(responseString)
//               
//           }
//           task.resume()
//       }
//       
//
//}
