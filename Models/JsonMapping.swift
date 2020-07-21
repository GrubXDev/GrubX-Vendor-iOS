import Foundation
import Foundation
import ObjectMapper


class AllBusiness : NSObject, NSCoding, Mappable{

    var data : [GetBusiness]?
    var message : String?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return AllBusiness()
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
         data = aDecoder.decodeObject(forKey: "data") as? [GetBusiness]
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
class GetBusiness : NSObject, NSCoding, Mappable{

    var address : String?
    var businessName : String?
    var createdAt : String?
    var empPin : AnyObject?
    var goods : String?
    var id : String?
    var ownerName : String?
    var updatedAt : String?
    var usersId : Int?
    var websiteUrl : AnyObject?


    class func newInstance(map: Map) -> Mappable?{
        return GetBusiness()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        address <- map["address"]
        businessName <- map["business_name"]
        createdAt <- map["created_at"]
        empPin <- map["emp_pin"]
        goods <- map["goods"]
        id <- map["id"]
        ownerName <- map["owner_name"]
        updatedAt <- map["updated_at"]
        usersId <- map["users_id"]
        websiteUrl <- map["website_url"]
        
    }

    @objc required init(coder aDecoder: NSCoder)
    {
         address = aDecoder.decodeObject(forKey: "address") as? String
         businessName = aDecoder.decodeObject(forKey: "business_name") as? String
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         empPin = aDecoder.decodeObject(forKey: "emp_pin") as? AnyObject
         goods = aDecoder.decodeObject(forKey: "goods") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         ownerName = aDecoder.decodeObject(forKey: "owner_name") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         usersId = aDecoder.decodeObject(forKey: "users_id") as? Int
         websiteUrl = aDecoder.decodeObject(forKey: "website_url") as? AnyObject

    }

    @objc func encode(with aCoder: NSCoder)
    {
        if address != nil{
            aCoder.encode(address, forKey: "address")
        }
        if businessName != nil{
            aCoder.encode(businessName, forKey: "business_name")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if empPin != nil{
            aCoder.encode(empPin, forKey: "emp_pin")
        }
        if goods != nil{
            aCoder.encode(goods, forKey: "goods")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if ownerName != nil{
            aCoder.encode(ownerName, forKey: "owner_name")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if usersId != nil{
            aCoder.encode(usersId, forKey: "users_id")
        }
        if websiteUrl != nil{
            aCoder.encode(websiteUrl, forKey: "website_url")
        }

    }

}
