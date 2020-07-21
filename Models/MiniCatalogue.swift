import Foundation
import ObjectMapper
class MiniCatalogueModel : NSObject, NSCoding, Mappable{

    var data : [MiniCatalogueData]?
    var message : String?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return MiniCatalogueModel()
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
         data = aDecoder.decodeObject(forKey: "data") as? [MiniCatalogueData]
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
class MiniCatalogueData : NSObject, NSCoding, Mappable{

    var createdAt : String?
     var productscount : String?
    var descriptionField : String?
    var id : Int?
    var imgUrl1 : String?
    var imgUrl2 : String?
    var imgUrl3 : String?
    var name : String?
    var offerPrice : String?
    var price : String?
    var quantity : String?
    var status : String?
    var stock : String?
    var type : String?
    var units : String?
    var updatedAt : String?
    var usersId : String?


    class func newInstance(map: Map) -> Mappable?{
        return MiniCatalogueData()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        createdAt <- map["created_at"]
        productscount <- map["productscount"]
        descriptionField <- map["description"]
        id <- map["id"]
        imgUrl1 <- map["img_url1"]
        imgUrl2 <- map["img_url2"]
        imgUrl3 <- map["img_url3"]
        name <- map["name"]
        offerPrice <- map["offer_price"]
        price <- map["price"]
        quantity <- map["quantity"]
        status <- map["status"]
        stock <- map["stock"]
        type <- map["type"]
        units <- map["units"]
        updatedAt <- map["updated_at"]
        usersId <- map["users_id"]
        
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        productscount = aDecoder.decodeObject(forKey: "productscount") as? String
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         imgUrl1 = aDecoder.decodeObject(forKey: "img_url1") as? String
         imgUrl2 = aDecoder.decodeObject(forKey: "img_url2") as? String
         imgUrl3 = aDecoder.decodeObject(forKey: "img_url3") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         offerPrice = aDecoder.decodeObject(forKey: "offer_price") as? String
         price = aDecoder.decodeObject(forKey: "price") as? String
         quantity = aDecoder.decodeObject(forKey: "quantity") as? String
         status = aDecoder.decodeObject(forKey: "status") as? String
         stock = aDecoder.decodeObject(forKey: "stock") as? String
         type = aDecoder.decodeObject(forKey: "type") as? String
         units = aDecoder.decodeObject(forKey: "units") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
         usersId = aDecoder.decodeObject(forKey: "users_id") as? String

    }

    @objc func encode(with aCoder: NSCoder)
    {
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        
        if productscount != nil{
            aCoder.encode(productscount, forKey: "productscount")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if imgUrl1 != nil{
            aCoder.encode(imgUrl1, forKey: "img_url1")
        }
        if imgUrl2 != nil{
            aCoder.encode(imgUrl2, forKey: "img_url2")
        }
        if imgUrl3 != nil{
            aCoder.encode(imgUrl3, forKey: "img_url3")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if offerPrice != nil{
            aCoder.encode(offerPrice, forKey: "offer_price")
        }
        if price != nil{
            aCoder.encode(price, forKey: "price")
        }
        if quantity != nil{
            aCoder.encode(quantity, forKey: "quantity")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if stock != nil{
            aCoder.encode(stock, forKey: "stock")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
        if units != nil{
            aCoder.encode(units, forKey: "units")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if usersId != nil{
            aCoder.encode(usersId, forKey: "users_id")
        }

    }

}
