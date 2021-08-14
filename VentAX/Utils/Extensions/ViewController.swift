//
//  ViewController.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 05/04/21.
//

import UIKit

extension UIViewController{
    func hideKeyboard(){
        let tap = UITapGestureRecognizer(target: self, action:#selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    func getTokenValue() -> String{
        if let token = UserDefaults.standard.string(forKey: Constants.APNsToken){
            return token
        }else{
            return "nil"
        }
    }
}
