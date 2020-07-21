

import Foundation
import ObjectMapper


class MyFavouritesModel : NSObject, NSCoding, Mappable{

    var data : [MyFavouritesData]?
    var message : String?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return MyFavouritesModel()
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
         data = aDecoder.decodeObject(forKey: "data") as? [MyFavouritesData]
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
class MyFavouritesData : NSObject, NSCoding, Mappable{

    var id : String?
    var imgUrl : String?
    var name : String?


    class func newInstance(map: Map) -> Mappable?{
        return MyFavouritesData()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        id <- map["id"]
        imgUrl <- map["img_url"]
        name <- map["name"]
        
    }

    @objc required init(coder aDecoder: NSCoder)
    {
         id = aDecoder.decodeObject(forKey: "id") as? String
         imgUrl = aDecoder.decodeObject(forKey: "img_url") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String

    }

    @objc func encode(with aCoder: NSCoder)
    {
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if imgUrl != nil{
            aCoder.encode(imgUrl, forKey: "img_url")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }

    }

}
