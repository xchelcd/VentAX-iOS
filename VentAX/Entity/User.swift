//
//  File.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 05/04/21.
//

import Foundation

struct User: Codable{
    let id:Int
    let name:String
    let lastName:String
    let userName:String
    let companyId:Int?
    let age:Int?
    let startDate:String
    let email:String?
    let ext:Int
    let phone:Int
    var affiliate:Int
    //var password:String?
    let token:String?
    
    /*enum CodingKeys: String, CodingKey{
        case id, name
        case lastName = "last_name"
        case userName = "user_name"
        case companyId = "company_id"
        case age
        case startDate = "start_date"
        case email, ext, phone, affiliate
        //case password
        case token
    }*/
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case lastName = "last_name"
        case userName = "user_name"
        case companyId = "company_id"
        case age
        case startDate = "start_date"
        case email, ext, phone, affiliate, token
    }
}

/*
 struct User: Codable {
     let id, name, lastName, userName: String
     let companyID, age: String?
     let startDate, email, ext, phone: String
     let affiliate: String
     let token: String?

     enum CodingKeys: String, CodingKey {
         case id, name
         case lastName = "last_name"
         case userName = "user_name"
         case companyID = "company_id"
         case age
         case startDate = "start_date"
         case email, ext, phone, affiliate, token
     }
 }

 */
