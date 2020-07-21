

import Foundation
import ObjectMapper


class SubCategory : NSObject, NSCoding, Mappable{

    var data : [Data1]?
    var message : String?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return SubCategory()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        data <- map["data"]
        message <- map["message"]
        success <- map["success"]
        
    }

   
    @objc required init(coder aDecoder: NSCoder)
    {
         data = aDecoder.decodeObject(forKey: "data") as? [Data1]
         message = aDecoder.decodeObject(forKey: "message") as? String
         success = aDecoder.decodeObject(forKey: "success") as? Bool

    }

    @objc func encode(with aCoder: NSCoder)
    {
        if data != nil{
            aCoder.encode(data, forKey: "data")
        }
        if message != nil{
            aCoder.encode(message, forKey: "message")
        }
        if success != nil{
            aCoder.encode(success, forKey: "success")
        }

    }

}


class Data1 : NSObject, NSCoding, Mappable{

    var categoriesId : Int?
    var createdAt : String?
    var id : Int?
    var imgUrl : String?
    var name : String?
    var status : AnyObject?
    var updatedAt : String?
    var usersId : Int?


    class func newInstance(map: Map) -> Mappable?{
        return Data1()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        categoriesId <- map["categories_id"]
        createdAt <- map["created_at"]
        id <- map["id"]
        imgUrl <- map["img_url"]
        name <- map["name"]
        status <- map["status"]
        updatedAt <- map["updated_at"]
        usersId <- map["users_id"]
        
    }

    @objc required init(coder aDecoder: NSCoder)
    {
         categoriesId = aDecoder.decodeObject(forKey: "categories_id") as? Int
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         imgUrl = aDecoder.decodeObject(forKey: "img_url") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         status = aDecoder.decodeObject(forKey: "status") as? AnyObject
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         usersId = aDecoder.decodeObject(forKey: "users_id") as? Int

    }

    @objc func encode(with aCoder: NSCoder)
    {
        if categoriesId != nil{
            aCoder.encode(categoriesId, forKey: "categories_id")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if imgUrl != nil{
            aCoder.encode(imgUrl, forKey: "img_url")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if usersId != nil{
            aCoder.encode(usersId, forKey: "users_id")
        }

    }

}
