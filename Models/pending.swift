
import Foundation

//MARK: - pendingRootClass
public struct pendingRootClass {

        public var data : [pendingDatum]!
        public var message : String!
        public var success : Bool!
        
}

public struct pendingDatum {

        public var buyername : String!
        public var deliveryLocation : String!
        public var discountCode : String!
        public var orderDate : String!
        public var orderNumber : String!
        public var orderamount : String!
        public var ordersId : String!
        public var ordersProducts : [ordersData]!
        public var paymentMode : String!
        public var type : String!
        
}
public struct ordersData{

       public var id : String!
       public var name : String!
       public var price : String!
       public var quantity : String!
        public var img_url1 : String!
}
