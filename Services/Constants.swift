//
//  Constants.swift
//  Grub X Vender
//
//  Created by vamsikrishna on 24/01/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import Foundation

//struct Bools {
//  static  var business:Bool?
//}
//venkybro
class Constants{
    static var baseUrl = "http://grubx.srimaruthienterprises.in/api/"
    static var img = "http://grubx.srimaruthienterprises.in/storage/cover_images"
    static var check = false
    static var buyerCheck = false
    static var contact:Bool?
    
}
struct API {
      static var pending = Constants.baseUrl + "buyerorders/124/"
    var imageFirstPath=Constants.img + "cover_images/"
    
    static var Catalogue = Constants.baseUrl + "usercatalogue/100"
    static var register = Constants.baseUrl + "registration"
    static var login = Constants.baseUrl + "login"
    static var banners = Constants.baseUrl + "banners/1"
    
    static var addProduct = Constants.baseUrl + "products"
    static var categories = Constants.baseUrl + "categories"
    static var subcategories = Constants.baseUrl + "subcategories/"
    static var updateProduct = Constants.baseUrl + "products/"
    
    static var addBusiness = Constants.baseUrl + "business"
    
    static var myFavouritesapi = Constants.baseUrl + "myfavorite/"
    static var changePasword = Constants.baseUrl + "changepassword"
    
    
    
    static var miniCatalogue = Constants.baseUrl + "usercatalogue"
    static var catalogueProducts = Constants.baseUrl + "vendorproducts/"
    
    
    static var favourites = Constants.baseUrl + "buyer"
    
    static var specialCataloguesend = Constants.baseUrl + "catalogue"
    static var placeOrder = Constants.baseUrl + "placeorders"
    static var allBuyers = Constants.baseUrl + "buyer"
    static var faqs = Constants.baseUrl + "faqs"
    static var contactus = Constants.baseUrl + "contactus"
  
    static var dashboardPost = Constants.baseUrl + "vendordashboardsettings"
    static var invoice = Constants.baseUrl + "getinvoicerorders/124"
    static var grubxPayment = Constants.baseUrl + "vendorpayments/124"
    static var aboutUs = Constants.baseUrl + "grubxinfo/1"
     static var dashboard = Constants.baseUrl + "getvendordashboardreports/124"
     static var placedOrders = Constants.baseUrl + "placedorders/124"
    
    
    
    static var subcategoriesnew = Constants.baseUrl
    
    
    
    
}
