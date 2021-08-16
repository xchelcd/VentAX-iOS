//
//  LogoutService.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 23/04/21.
//

import Foundation

class LogoutService{
    //private let endpoint = Endpoint.logOut
    private let endpoint = EndPoint.LOG_OUT
    
    func LogOutAccount(userId:Int, token:String, onLogoutSuccess: @escaping (_ isLogout:Bool) -> ()){
        guard let url = URL(string:"\(Constants.END_POINT)\(endpoint)") else { return }
        let body: [String: Any] = [
            "user_id": userId,
            "token": token
        ]
        
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = body.encodeURL()
        
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            guard let _ = data else {
                onLogoutSuccess(false)
                return
            }
            onLogoutSuccess(true)
        }.resume()
    }
}
