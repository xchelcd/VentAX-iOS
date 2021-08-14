//
//  Entrepreneur.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 04/04/21.
//

import Foundation

struct EntrepreneurModel: Codable{
    let company:Company
    var design:Design
    var productList:[Product]?
    var scheduleList:[Schedule]?
    var faqList:[FAQ]?
    var socialMediaList:[SocialMedia]?
    
    /*enum CodingKeys: String, CodingKey{
        case company = "Company"
        case design = "Design"
        case productList = "Products"
        case scheduleList = "Schedules"
        case faqList = "FAQs"
        case socialMediaList = "SocialMedias"
    }*/
    
    enum CodingKeys: String, CodingKey {
        case company = "Company"
        case design = "Design"
        case productList = "Products"
        case scheduleList = "Schedules"
        case faqList = "FAQs"
        case socialMediaList = "SocialMedias"
    }
}

/*
 struct EntrepreneurModel: Codable {
     let company: Company
     let design: Design
     let products: [Product]
     let schedules: [Schedule_]
     let faQs: [FAQ]
     let socialMedias: [SocialMedia]

     enum CodingKeys: String, CodingKey {
         case company = "Company"
         case design = "Design"
         case products = "Products"
         case schedules = "Schedules"
         case faQs = "FAQs"
         case socialMedias = "SocialMedias"
     }
 }
 */
