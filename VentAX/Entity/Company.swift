//
//  Company.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 04/04/21.
//

import Foundation

struct Company: Codable{
    let id:Int
    let userId:Int
    var name:String
    var description:String
    var category:Int
    var address:String?
    var active:Int
    var priority:Int
    let token:String
    
    /*enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case name
        case description = "description"
        case category = "category_id"
        case address, active, priority, token
    }*/
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case name
        case description = "description"
        case category = "category_id"
        case address, active, priority, token
    }
}

/*
 struct Company: Codable {
     let id, userID, name, companyDescription: String
     let categoryID, address, active, priority: String
     let token: String

     enum CodingKeys: String, CodingKey {
         case id
         case userID = "user_id"
         case name
         case companyDescription = "description"
         case categoryID = "category_id"
         case address, active, priority, token
     }
 }
 */
