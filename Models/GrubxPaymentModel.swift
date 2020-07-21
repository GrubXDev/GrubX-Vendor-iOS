import Foundation
import ObjectMapper


class GrubxPaymentModel : NSObject, NSCoding, Mappable{

    var data : [GrubxPaymentModelData]?
    var message : String?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return GrubxPaymentModel()
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
         data = aDecoder.decodeObject(forKey: "data") as? [GrubxPaymentModelData]
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
class GrubxPaymentModelData : NSObject, NSCoding, Mappable{

    var amount : String?
    var createdAt : String?
    var id : String?
    var usersId : String?


    class func newInstance(map: Map) -> Mappable?{
        return GrubxPaymentModelData()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        amount <- map["amount"]
        createdAt <- map["created_at"]
        id <- map["id"]
        usersId <- map["users_id"]
        
    }

    @objc required init(coder aDecoder: NSCoder)
    {
         amount = aDecoder.decodeObject(forKey: "amount") as? String
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         usersId = aDecoder.decodeObject(forKey: "users_id") as? String

    }

    @objc func encode(with aCoder: NSCoder)
    {
        if amount != nil{
            aCoder.encode(amount, forKey: "amount")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if usersId != nil{
            aCoder.encode(usersId, forKey: "users_id")
        }

    }

}
