//
//  LoginModel.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 04/04/21.
//

import Foundation

struct LoginModel:Codable{
    var user:User
    var companyList:[Company]?
    var entrepreneurModel:EntrepreneurModel?
    
    
    /*enum CodingKeys: String, CodingKey{
        case user = "User"
        case companyList = "Company"
        case entrepreneurModel = "ModelEntrepreneur"
    }*/
    
    enum CodingKeys: String, CodingKey {
        case user = "User"
        case companyList = "Company"
        case entrepreneurModel = "ModelEntrepreneur"
    }
}


/*
 struct LoginModel: Codable {
     let user: User
     let company: [Company]
     let modelEntrepreneur: EntrepreneurModel

     enum CodingKeys: String, CodingKey {
         case user = "User"
         case company = "Company"
         case modelEntrepreneur = "ModelEntrepreneur"
     }
 }
 */
