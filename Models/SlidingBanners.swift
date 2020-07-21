
import Foundation
import ObjectMapper


class SlidersBanners : NSObject, NSCoding, Mappable{

    var data : [SlidingBannersData]?
    var message : String?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return SlidersBanners()
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
         data = aDecoder.decodeObject(forKey: "data") as? [SlidingBannersData]
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
class SlidingBannersData : NSObject, NSCoding, Mappable{

    var id : String?
    var imgUrl : String?
    var status : String?
    var type : String?


    class func newInstance(map: Map) -> Mappable?{
        return SlidingBannersData()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        id <- map["id"]
        imgUrl <- map["img_url"]
        status <- map["status"]
        type <- map["type"]
        
    }

    @objc required init(coder aDecoder: NSCoder)
    {
         id = aDecoder.decodeObject(forKey: "id") as? String
         imgUrl = aDecoder.decodeObject(forKey: "img_url") as? String
         status = aDecoder.decodeObject(forKey: "status") as? String
         type = aDecoder.decodeObject(forKey: "type") as? String

    }

    @objc func encode(with aCoder: NSCoder)
    {
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if imgUrl != nil{
            aCoder.encode(imgUrl, forKey: "img_url")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }

    }

}
