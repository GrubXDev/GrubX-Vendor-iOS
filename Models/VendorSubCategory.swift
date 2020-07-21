import Foundation

//MARK: - SubcategoryRootClass
public struct SubcategoryVendor {

        public var data : SubcategoryDatumvendor!
        public var message : String!
        public var success : Bool!
        
}
public struct SubcategoryDatumvendor {

    public var subcategorydata : [Subcategoryvendorllist]!
        public var path : String!
        
}
public struct Subcategoryvendorllist {

        public var createdAt : String!
        public var id : String!
        public var imgUrl : String!
        public var name : String!
        public var totalproducts : String!
        public var updatedAt : String!
        
}
