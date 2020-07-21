import Foundation
import ObjectMapper


class AllBuyers : NSObject, NSCoding, Mappable{

    var data : [AllBuyersData]?
    var message : String?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return AllBuyers()
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
         data = aDecoder.decodeObject(forKey: "data") as? [AllBuyersData]
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
class AllBuyersData : NSObject, NSCoding, Mappable{

    var businessName : String?
     var phone : String?
    var pincode : String?
    var buyers_id : String?
    var createdAt : String?
    var id : String?
    var imgUrl : String?
    var name : String?
    var updatedAt : String?


    class func newInstance(map: Map) -> Mappable?{
        return AllBuyersData()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        businessName <- map["business_name"]
        phone <- map["phone"]
        pincode <- map["pincode"]
        buyers_id <- map["buyers_id"]
        createdAt <- map["created_at"]
        id <- map["id"]
        imgUrl <- map["img_url"]
        name <- map["name"]
        updatedAt <- map["updated_at"]
        
    }

    @objc required init(coder aDecoder: NSCoder)
    {
         businessName = aDecoder.decodeObject(forKey: "business_name") as? String
        phone = aDecoder.decodeObject(forKey: "phone") as? String
         pincode = aDecoder.decodeObject(forKey: "pincode") as? String
        
        buyers_id = aDecoder.decodeObject(forKey: "buyers_id") as? String
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         imgUrl = aDecoder.decodeObject(forKey: "img_url") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String

    }

    @objc func encode(with aCoder: NSCoder)
    {
        if businessName != nil{
            aCoder.encode(businessName, forKey: "business_name")
        }
        if phone != nil{
                   aCoder.encode(phone, forKey: "phone")
               }
        if pincode != nil{
                          aCoder.encode(pincode, forKey: "pincode")
                      }
        if buyers_id != nil{
                   aCoder.encode(buyers_id, forKey: "buyers_id")
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
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }

    }

}
