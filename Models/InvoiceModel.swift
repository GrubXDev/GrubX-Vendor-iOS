import Foundation
import ObjectMapper


class InvoiceModel : NSObject, NSCoding, Mappable{

    var data : [InvoiceModeldata]?
    var message : String?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return InvoiceModel()
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
         data = aDecoder.decodeObject(forKey: "data") as? [InvoiceModeldata]
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
class InvoiceModeldata : NSObject, NSCoding, Mappable{

    var paymentMode : String?
    var amountDetails : AmountDetail?
    var buyername : String?
    var deliveryLocation : String?
    var orderDate : String?
    var orderNumber : String?
    var ordersId : String?
    var ordersProducts : [OrdersProduct]?


    class func newInstance(map: Map) -> Mappable?{
        return InvoiceModeldata()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        paymentMode <- map["PaymentMode"]
        amountDetails <- map["amount_details"]
        buyername <- map["buyername"]
        deliveryLocation <- map["delivery_location"]
        orderDate <- map["order_date"]
        orderNumber <- map["order_number"]
        ordersId <- map["orders_id"]
        ordersProducts <- map["orders_products"]
        
    }

    @objc required init(coder aDecoder: NSCoder)
    {
         paymentMode = aDecoder.decodeObject(forKey: "PaymentMode") as? String
         amountDetails = aDecoder.decodeObject(forKey: "amount_details") as? AmountDetail
         buyername = aDecoder.decodeObject(forKey: "buyername") as? String
         deliveryLocation = aDecoder.decodeObject(forKey: "delivery_location") as? String
         orderDate = aDecoder.decodeObject(forKey: "order_date") as? String
         orderNumber = aDecoder.decodeObject(forKey: "order_number") as? String
         ordersId = aDecoder.decodeObject(forKey: "orders_id") as? String
         ordersProducts = aDecoder.decodeObject(forKey: "orders_products") as? [OrdersProduct]

    }

    @objc func encode(with aCoder: NSCoder)
    {
        if paymentMode != nil{
            aCoder.encode(paymentMode, forKey: "PaymentMode")
        }
        if amountDetails != nil{
            aCoder.encode(amountDetails, forKey: "amount_details")
        }
        if buyername != nil{
            aCoder.encode(buyername, forKey: "buyername")
        }
        if deliveryLocation != nil{
            aCoder.encode(deliveryLocation, forKey: "delivery_location")
        }
        if orderDate != nil{
            aCoder.encode(orderDate, forKey: "order_date")
        }
        if orderNumber != nil{
            aCoder.encode(orderNumber, forKey: "order_number")
        }
        if ordersId != nil{
            aCoder.encode(ordersId, forKey: "orders_id")
        }
        if ordersProducts != nil{
            aCoder.encode(ordersProducts, forKey: "orders_products")
        }

    }

}
class OrdersProduct : NSObject, NSCoding, Mappable{

    var id : String?
    var name : String?
    var price : String?
    var quantity : String?


    class func newInstance(map: Map) -> Mappable?{
        return OrdersProduct()
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
         price = aDecoder.decodeObject(forKey: "price") as? String
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
class AmountDetail : NSObject, NSCoding, Mappable{

    var deliveryCharges : String?
    var subtotalamount : String?
    var totalAmount : Int?


    class func newInstance(map: Map) -> Mappable?{
        return AmountDetail()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        deliveryCharges <- map["delivery_charges"]
        subtotalamount <- map["subtotalamount"]
        totalAmount <- map["total_amount"]
        
    }

    @objc required init(coder aDecoder: NSCoder)
    {
         deliveryCharges = aDecoder.decodeObject(forKey: "delivery_charges") as? String
         subtotalamount = aDecoder.decodeObject(forKey: "subtotalamount") as? String
         totalAmount = aDecoder.decodeObject(forKey: "total_amount") as? Int

    }

    @objc func encode(with aCoder: NSCoder)
    {
        if deliveryCharges != nil{
            aCoder.encode(deliveryCharges, forKey: "delivery_charges")
        }
        if subtotalamount != nil{
            aCoder.encode(subtotalamount, forKey: "subtotalamount")
        }
        if totalAmount != nil{
            aCoder.encode(totalAmount, forKey: "total_amount")
        }

    }

}
