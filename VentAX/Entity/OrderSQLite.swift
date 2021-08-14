//
//  OrderSQLite.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 04/04/21.
//

import Foundation

struct OrderSQLite{
    let id:Int
    let companyId:Int
    let companyName:String
    let productId:Int
    let productName:String
    var qty:Int
    var price:Double
    var comment:String?
}
