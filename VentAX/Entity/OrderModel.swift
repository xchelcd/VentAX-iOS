//
//  OrderModel.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 04/04/21.
//

import Foundation

struct OrderModel: Codable{
    let orderId:Int
    let phone:String?
    let userId:Int
    let personName:String?
    let companyId:Int
    let companyName:String
    var state:Int
    var total:Double
    let date:String
    var comment:String?
    var orderProductList: [OrderProduct]
    
    enum CodingKeys: String, CodingKey{
        case orderId = "order_id"
        case phone
        case userId = "user_id"
        case personName = "first_name"
        case companyId = "company_id"
        case companyName = "name"
        case state
        case total
        case date
        case comment
        case orderProductList = "products"
    }
}
