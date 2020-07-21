//
//  VendorProductsModelRootClass.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on February 19, 2020

import Foundation

//MARK: - VendorProductsModelRootClass
public struct VendorProductsModelRootClass {

        public var data : VendorProductsModelDatum!
        public var message : String!
        public var success : Bool!
        
}
public struct VendorProductsModelDatum {

        public var vendorproductlist : [VendorProductsModel0]!
        public var path : String!
        
}
public struct VendorProductsModel0 {

        public var descriptionField : String!
        public var id : String!
        public var imgUrl1 : String!
        public var imgUrl2 : String!
        public var imgUrl3 : String!
        public var name : String!
        public var offerPrice : String!
        public var price : String!
        public var quantity : String!
        public var stock : String!
        public var units : String!
        
}
