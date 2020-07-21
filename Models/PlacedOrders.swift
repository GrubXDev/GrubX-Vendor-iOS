import Foundation
import ObjectMapper


class PlacedOrders : NSObject, NSCoding, Mappable{

    var data : [PlacedOrdersData]?
    var message : String?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return PlacedOrders()
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
         data = aDecoder.decodeObject(forKey: "data") as? [PlacedOrdersData]
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
import Foundation
import ObjectMapper


class PlacedOrdersData : NSObject, NSCoding, Mappable{

    var orderDate : String?
    var placeordersBuyers : [PlaceordersBuyer]?
    var placeordersId : String?
    var placeordersProducts : [PlaceordersProduct]?


    class func newInstance(map: Map) -> Mappable?{
        return PlacedOrdersData()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        orderDate <- map["order_date"]
        placeordersBuyers <- map["placeorders_buyers"]
        placeordersId <- map["placeorders_id"]
        placeordersProducts <- map["placeorders_products"]
        
    }

    @objc required init(coder aDecoder: NSCoder)
    {
         orderDate = aDecoder.decodeObject(forKey: "order_date") as? String
         placeordersBuyers = aDecoder.decodeObject(forKey: "placeorders_buyers") as? [PlaceordersBuyer]
         placeordersId = aDecoder.decodeObject(forKey: "placeorders_id") as? String
         placeordersProducts = aDecoder.decodeObject(forKey: "placeorders_products") as? [PlaceordersProduct]

    }

    @objc func encode(with aCoder: NSCoder)
    {
        if orderDate != nil{
            aCoder.encode(orderDate, forKey: "order_date")
        }
        if placeordersBuyers != nil{
            aCoder.encode(placeordersBuyers, forKey: "placeorders_buyers")
        }
        if placeordersId != nil{
            aCoder.encode(placeordersId, forKey: "placeorders_id")
        }
        if placeordersProducts != nil{
            aCoder.encode(placeordersProducts, forKey: "placeorders_products")
        }

    }

}
class PlaceordersProduct : NSObject, NSCoding, Mappable{

    var id : String?
    var name : String?
    var price : AnyObject?
    var quantity : String?


    class func newInstance(map: Map) -> Mappable?{
        return PlaceordersProduct()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        id <- map["id"]
        name <- map["name"]
        price <- map["price"]
        quantity <- map["quantity"]
        
    }

    @objc required init(coder aDecoder: NSCoder)
    {
         id = aDecoder.decodeObject(forKey: "id") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         price = aDecoder.decodeObject(forKey: "price") as? AnyObject
         quantity = aDecoder.decodeObject(forKey: "quantity") as? String

    }

    @objc func encode(with aCoder: NSCoder)
    {
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if price != nil{
            aCoder.encode(price, forKey: "price")
        }
        if quantity != nil{
            aCoder.encode(quantity, forKey: "quantity")
        }

    }

}
class PlaceordersBuyer : NSObject, NSCoding, Mappable{

    var id : AnyObject?
    var name : AnyObject?


    class func newInstance(map: Map) -> Mappable?{
        return PlaceordersBuyer()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        id <- map["id"]
        name <- map["name"]
        
    }

    @objc required init(coder aDecoder: NSCoder)
    {
         id = aDecoder.decodeObject(forKey: "id") as? AnyObject
         name = aDecoder.decodeObject(forKey: "name") as? AnyObject

    }

    @objc func encode(with aCoder: NSCoder)
    {
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }

    }

}
