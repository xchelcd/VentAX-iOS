//
//  IDAXService.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 23/04/21.
//

import Foundation

class IDAXService{
    
    private let endpoint = Endpoint.suggestion
    
    func InsertSuggestion(_ userId:Int, _ suggestion:String, onSuccessfull: @escaping (_ finished:Bool) -> ()){
        guard let url:URL = URL(string: "\(Constants.END_POINT)\(endpoint)") else { return }
        let body:[String: Any] = [
            "user_id": userId,
            "suggestion": suggestion
        ]
        
        var request = URLRequest(url:url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = body.encodeURL()
        
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            guard let _ = data else {
                onSuccessfull(false)
                return
            }
            onSuccessfull(true)
        }.resume()
    }
    
}
