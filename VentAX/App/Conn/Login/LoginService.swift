//
//  LoginService.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 08/04/21.
//

import Foundation


class LoginService{
    
    private let endPointNotLogged = Endpoint.notLogged//"GetUserByCredentialsAndCheckAffiliate"//Endpoint = .notLogged
    private let endPointLogged = Endpoint.logged//"GetCheckUserByUserCredentials"//:Endpoint = .logged
    var data:LoginModel?
    
    var url:URL?
    var body:[String:Any]?
    
    func checkCredentials(_ id:Int, _ phone:String, _ password:String, _ token:String, _ logged:Bool, onSuccess: @escaping (_ loginModel:LoginModel) -> (), onError: @escaping (_ error:Error?) -> (), onFinished: @escaping (_ code:Int) -> ()){
        
        if logged {
            guard let url = URL(string: "\(Constants.END_POINT)\(endPointLogged)") else { return }
            let body: [String:Any] = [
                "phone": phone,
                "id": id
            ]
            self.url = url
            self.body = body
        }else{
            guard let url = URL(string: "\(Constants.END_POINT)\(endPointNotLogged)") else { return }
            let body: [String:Any] = [
                "phone": phone,
                "password": password,
                "token": token,
                "os": Constants.IOS
            ]
            self.url = url
            self.body = body
        }
        print(url!)
        
        var request = URLRequest(url: url!)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = body!.encodeURL()
        
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            guard let json = data else { return }
            do{
                self.data = try JSONDecoder().decode(LoginModel.self, from: json)
                if let loginModel = self.data{
                    onSuccess(loginModel)
                }else{
                    onError(error)
                }
                onFinished(0)
                return
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
            onFinished(1)
        }.resume()
    }
}
