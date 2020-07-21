import Foundation
import ObjectMapper


class BuyerDetailedData : NSObject, NSCoding, Mappable{

    var data : [BuyerDetailedContent]?
    var message : String?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return BuyerDetailedData()
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
         data = aDecoder.decodeObject(forKey: "data") as? [BuyerDetailedContent]
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
class BuyerDetailedContent : NSObject, NSCoding, Mappable{

    var address : String?
    var businessName : String?
    var createdAt : String?
    var email : String?
    var goods : String?
    var id : String?
    var imgUrl : String?
    var name : String?
    var ownerName : String?
    var phone : String?
    var updatedAt : String?
    var websiteUrl : String?


    class func newInstance(map: Map) -> Mappable?{
        return BuyerDetailedContent()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        address <- map["address"]
        businessName <- map["business_name"]
        createdAt <- map["created_at"]
        email <- map["email"]
        goods <- map["goods"]
        id <- map["id"]
        imgUrl <- map["img_url"]
        name <- map["name"]
        ownerName <- map["owner_name"]
        phone <- map["phone"]
        updatedAt <- map["updated_at"]
        websiteUrl <- map["website_url"]
        
    }

    @objc required init(coder aDecoder: NSCoder)
    {
         address = aDecoder.decodeObject(forKey: "address") as? String
         businessName = aDecoder.decodeObject(forKey: "business_name") as? String
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         email = aDecoder.decodeObject(forKey: "email") as? String
         goods = aDecoder.decodeObject(forKey: "goods") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         imgUrl = aDecoder.decodeObject(forKey: "img_url") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         ownerName = aDecoder.decodeObject(forKey: "owner_name") as? String
         phone = aDecoder.decodeObject(forKey: "phone") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         websiteUrl = aDecoder.decodeObject(forKey: "website_url") as? String

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
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if goods != nil{
            aCoder.encode(goods, forKey: "goods")
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
        if ownerName != nil{
            aCoder.encode(ownerName, forKey: "owner_name")
        }
        if phone != nil{
            aCoder.encode(phone, forKey: "phone")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if websiteUrl != nil{
            aCoder.encode(websiteUrl, forKey: "website_url")
        }

    }

}
