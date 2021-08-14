//
//  Connection.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 05/04/21.
//

import Foundation

class Connection{
    
    
}



/*
 static let conn = Connection()
 let end = "GetUserByCredentialsAndCheckAffiliate"
 var data:LoginModel?
 
 func checkCredentials(phone:String, password:String, token:String, onSuccess: @escaping (_ loginModel:LoginModel) -> (), onError: @escaping (_ error:Error?) -> (), onFinished: @escaping () -> ()){
     
     guard let url = URL(string: "\(Constants.END_POINT)\(end)") else { return }
     //print(url)
     //guard let body = try? JSONEncoder.encode(obj) else { return }
     let body: [String:Any] = [
         "phone": phone,
         "password": password,
         "token": token,
         "os": Constants.IOS
     ]
     //print(body)
     var request = URLRequest(url: url)
     request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
     request.httpMethod = "POST"
     request.httpBody = body.encodeURL()
     
     
     URLSession.shared.dataTask(with: request){ (data, response, error) in
         guard let json = data else { return }
         //print("\(String(data: json, encoding: .utf8))")
         //print(response)
         do{
             self.data = try JSONDecoder().decode(LoginModel.self, from: json)
             if let loginModel = self.data{
                 onSuccess(loginModel)
             }else{
                 onError(error)
             }
             onFinished()
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
         }/*catch DecodingError.keyNotFound(let key, let context) {
             Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
         } catch DecodingError.valueNotFound(let type, let context) {
             Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
         } catch DecodingError.typeMismatch(let type, let context) {
             Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
         } catch DecodingError.dataCorrupted(let context) {
             Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
         } catch let error as NSError {
             NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
         }*/
     }.resume()
 }
 */
