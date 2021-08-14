//
//  FAQModel.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 04/04/21.
//

import Foundation

struct FAQModel: Codable{
    let companyId:Int
    var faqList: [FAQ]
    
    enum CodingKeys: String, CodingKey{
        case companyId = "company_id"
        case faqList = "faqs"
    }
}
