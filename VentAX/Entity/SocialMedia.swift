//
//  SocialMedia.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 05/04/21.
//

import Foundation

struct SocialMedia: Codable{
    var socialMediaId:Int
    var code:String
    
    enum CodingKeys: String, CodingKey{
        case socialMediaId = "id"
        case code
    }
}

/*
 struct SocialMedia: Codable {
     let id: String
     let code: String
 }
 */
