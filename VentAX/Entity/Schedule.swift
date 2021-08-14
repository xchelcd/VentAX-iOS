//
//  Schedule.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 05/04/21.
//

import Foundation

struct Schedule: Codable{
    var day:Int?
    var start:String?
    var end:String?
    
    enum CodingKeys: String, CodingKey{
        case day = "day_id"
        case start
        case end
    }
}
