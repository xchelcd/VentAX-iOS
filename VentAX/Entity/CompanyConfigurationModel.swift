//
//  CompanyConfigurationModel.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 04/04/21.
//

import Foundation

struct CompanyConfigurationModel: Codable{
    var design:Design
    var scheduleList:[Schedule]
    var socialMediaList:[SocialMedia]
    let companyId:Int
    
    enum CodingKeys: String, CodingKey{
        case design
        case scheduleList = "schedules"
        case socialMediaList = "social_media"
        case companyId = "company_id"
    }
}
