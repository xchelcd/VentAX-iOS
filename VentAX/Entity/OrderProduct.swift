//
//  OrderProduct.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 04/04/21.
//

import Foundation

struct OrderProduct: Codable{
    let productId:Int
    let product:String
    var qty:Int
    var total:Double
    
    enum CodingKeys: String, CodingKey{
        case productId = "product_id"
        case product = "name"
        case qty
        case total
    }
}
