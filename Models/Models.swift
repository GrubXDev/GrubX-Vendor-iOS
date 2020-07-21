
import Foundation
import ObjectMapper
class Category : NSObject, NSCoding, Mappable{

    var data : [DataCategory]?
    var message : String?
    var success : Bool?
    class func newInstance(map: Map) -> Mappable?{
        return Category()
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
         data = aDecoder.decodeObject(forKey: "data") as? [DataCategory]
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
class DataCategory : NSObject, NSCoding, Mappable{

    var createdAt : String?
    var id : Int?
    var imgUrl : String?
    var name : String?
    var updatedAt : String?


    class func newInstance(map: Map) -> Mappable?{
        return DataCategory()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        createdAt <- map["created_at"]
        id <- map["id"]
        imgUrl <- map["img_url"]
        name <- map["name"]
        updatedAt <- map["updated_at"]
        
    }

    @objc required init(coder aDecoder: NSCoder)
    {
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         imgUrl = aDecoder.decodeObject(forKey: "img_url") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String

    }

    @objc func encode(with aCoder: NSCoder)
    {
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
