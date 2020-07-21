
import Foundation

//MARK: - CategoriesRootClass
public struct CategoriesRootClass {

        public var data : CategoriesDatum!
        public var message : String!
        public var success : Bool!
        
}
public struct CategoriesDatum {

        public var categoriesdata : [Categories0]!
        public var path : String!
        
}
public struct Categories0 {

        public var createdAt : String!
        public var id : String!
        public var imgUrl : String!
        public var name : String!
        public var totalproducts : String!
        public var updatedAt : String!
        
}
