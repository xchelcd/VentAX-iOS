//
//  Design.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 04/04/21.
//

import Foundation

struct Design: Codable{
    var columns:Int
    var mainBackground:String
    var cardBackground:String
    var titleColor:String
    var textColor:String
    var dialogBackground:String
    
    /*enum CodingKeys: String, CodingKey {
        case columns
        case mainBackground = "main_background"
        case cardBackground = "card_background"
        case titleColor = "title_color"
        case textColor = "text_color"
        case dialogBackground = "dialog_background"
    }*/
    
    enum CodingKeys: String, CodingKey {
        case columns
        case mainBackground = "main_background"
        case cardBackground = "card_background"
        case titleColor = "title_color"
        case textColor = "text_color"
        case dialogBackground = "dialog_background"
    }
}

/*
 struct Design: Codable {
     let columns, mainBackground, cardBackground, titleColor: String
     let textColor, dialogBackground: String

     enum CodingKeys: String, CodingKey {
         case columns
         case mainBackground = "main_background"
         case cardBackground = "card_background"
         case titleColor = "title_color"
         case textColor = "text_color"
         case dialogBackground = "dialog_background"
     }
 }
 */
