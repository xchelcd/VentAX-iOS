//
//  ImageView.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 10/04/21.
//

import Foundation
import UIKit

extension UIImageView{
    func imageFromServer(url:String){
        if self.image == nil{
            self.image = UIImage(named: "Ventax_logo")
        }
        
        let urlEncode = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        //print(url)
        //print(urlEncode)
        URLSession.shared.dataTask(with: URL(string: urlEncode)!){ (data, response, error) in
            if error != nil{
                return
            }
            DispatchQueue.main.async {
                guard let data = data else { return }
                let image = UIImage(data: data)
                self.image = image
            }
        }.resume()
    }
    
    func designImage1(){
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 5, height: -5)
    }
}
