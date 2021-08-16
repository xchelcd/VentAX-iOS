//
//  HomeService.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 17/04/21.
//

import Foundation

class HomeService{
    
    //private let endPoint = Endpoint.home
    private let endPoint = EndPoint.ENTREPRENEUR_MODEL
    
    var data:EntrepreneurModel?
    
    
    func getCompanyEntrepreneurModel(_ companyId:Int, onSuccess: @escaping (_ entrepreneurModel:EntrepreneurModel) -> (), onError: @escaping (_ error:Error?) -> (), onFinished: @escaping (_ code:Int) -> ()){
        
        guard let url: URL = URL(string: "\(Constants.END_POINT)\(endPoint)&company_id=\(companyId)") else { return }
        //print(url.description)
        
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            guard let json = data else { return }
            do{
                self.data = try JSONDecoder().decode(EntrepreneurModel.self, from: json)
                if let entrepreneurModel = self.data{
                    onSuccess(entrepreneurModel)
                }else {
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
