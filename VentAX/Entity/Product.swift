//
//  Product.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 04/04/21.
//

import Foundation

struct Product: Codable{
    let id:Int
    let companyId:Int
    var name:String
    let price:Double
    let description:String
    let details:String
    let image:Int
    var position:Int
    var state:Int
    
    /*enum CodingKeys: String, CodingKey{
        case id
        case companyId = "company_id"
        case name, description, price, details, position, state
        case image = "img"
    }*/
    
    enum CodingKeys: String, CodingKey {
        case id
        case companyId = "company_id"
        case name
        case description = "description"
        case price, details, position, state
        case image = "img"
    }
}

/*
 struct Product: Codable {
     let id, companyID, name, productDescription: String
     let price, details, position, state: String
     let img: String

     enum CodingKeys: String, CodingKey {
         case id
         case companyID = "company_id"
         case name
         case productDescription = "description"
         case price, details, position, state, img
     }
 }
*/
