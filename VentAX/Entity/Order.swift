//
//  Order.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 04/04/21.
//

import Foundation

struct Order: Codable{
    let userId:Int
    let companyId:Int
    let productId:Int
    let qty:Int
    let date:String
    let comment:String?
    
    enum CodingKeys: String, CodingKey{
        case userId = "user_id"
        case companyId = "company_id"
        case productId = "product_id"
        case qty
        case date
        case comment
    }
}
