//
//    RootClass.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper


class Dashboard : NSObject, NSCoding, Mappable{

    var data : [DashboardData]?
    var message : String?
    var success : Bool?


    class func newInstance(map: Map) -> Mappable?{
        return Dashboard()
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
         data = aDecoder.decodeObject(forKey: "data") as? [DashboardData]
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
class DashboardData : NSObject, NSCoding, Mappable{

    var buyersActive : Int?
    var buyersInactive : Int?
    var buyersNew : Int?
    var ordersCancel : Int?
    var ordersCompleted : Int?
    var ordersPending : Int?
    var productsCount : Int?
    var productsLessSale : Int?
    var productsNew : Int?
    var productsTopSale : Int?
    var todaysSale : Int?


    class func newInstance(map: Map) -> Mappable?{
        return DashboardData()
    }
    required init?(map: Map){}
    private override init(){}

    func mapping(map: Map)
    {
        buyersActive <- map["buyers_active"]
        buyersInactive <- map["buyers_inactive"]
        buyersNew <- map["buyers_new"]
        ordersCancel <- map["orders_cancel"]
        ordersCompleted <- map["orders_completed"]
        ordersPending <- map["orders_pending"]
        productsCount <- map["products_count"]
        productsLessSale <- map["products_less_sale"]
        productsNew <- map["products_new"]
        productsTopSale <- map["products_top_sale"]
        todaysSale <- map["todays_sale"]
        
    }

    @objc required init(coder aDecoder: NSCoder)
    {
         buyersActive = aDecoder.decodeObject(forKey: "buyers_active") as? Int
         buyersInactive = aDecoder.decodeObject(forKey: "buyers_inactive") as? Int
         buyersNew = aDecoder.decodeObject(forKey: "buyers_new") as? Int
         ordersCancel = aDecoder.decodeObject(forKey: "orders_cancel") as? Int
         ordersCompleted = aDecoder.decodeObject(forKey: "orders_completed") as? Int
         ordersPending = aDecoder.decodeObject(forKey: "orders_pending") as? Int
         productsCount = aDecoder.decodeObject(forKey: "products_count") as? Int
         productsLessSale = aDecoder.decodeObject(forKey: "products_less_sale") as? Int
         productsNew = aDecoder.decodeObject(forKey: "products_new") as? Int
         productsTopSale = aDecoder.decodeObject(forKey: "products_top_sale") as? Int
         todaysSale = aDecoder.decodeObject(forKey: "todays_sale") as? Int

    }

    @objc func encode(with aCoder: NSCoder)
    {
        if buyersActive != nil{
            aCoder.encode(buyersActive, forKey: "buyers_active")
        }
        if buyersInactive != nil{
            aCoder.encode(buyersInactive, forKey: "buyers_inactive")
        }
        if buyersNew != nil{
            aCoder.encode(buyersNew, forKey: "buyers_new")
        }
        if ordersCancel != nil{
            aCoder.encode(ordersCancel, forKey: "orders_cancel")
        }
        if ordersCompleted != nil{
            aCoder.encode(ordersCompleted, forKey: "orders_completed")
        }
        if ordersPending != nil{
            aCoder.encode(ordersPending, forKey: "orders_pending")
        }
        if productsCount != nil{
            aCoder.encode(productsCount, forKey: "products_count")
        }
        if productsLessSale != nil{
            aCoder.encode(productsLessSale, forKey: "products_less_sale")
        }
        if productsNew != nil{
            aCoder.encode(productsNew, forKey: "products_new")
        }
        if productsTopSale != nil{
            aCoder.encode(productsTopSale, forKey: "products_top_sale")
        }
        if todaysSale != nil{
            aCoder.encode(todaysSale, forKey: "todays_sale")
        }

    }

}
