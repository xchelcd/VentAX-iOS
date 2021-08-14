//
//  TextField.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 06/04/21.
//

import UIKit

extension UITextField {
    
    func designIsSelected(selected state:Bool){
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 5))
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 15
        self.borderStyle = .none
        self.leftView = padding
        self.leftViewMode = .always
        self.layer.borderColor = (UIColor.red).cgColor
        self.layer.borderColor = (UIColor(named: state ? "fucsiaVentax" : "blueVentax"))?.cgColor
    }
    
    func designSelected(){
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 10))
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 15
        self.borderStyle = .none
        self.leftView = padding
        self.leftViewMode = .always
        self.layer.borderColor = (UIColor.red).cgColor
        self.layer.borderColor = (UIColor(named: "blueVentax"))?.cgColor
        //self.layer.borderColor = (UIColor(named: "fucsiaVentax") as! CGColor)
    }
    
    func designNotSelected(){
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 10))
        self.layer.borderWidth = 1
        self.borderStyle = .none
        self.layer.cornerRadius = 12
        self.layer.borderColor = (UIColor(named: "fucsiaVentax"))?.cgColor
        //self.layer.borderColor = CGColor(red: 255, green: 100, blue: 20, alpha: 1)
        self.leftView = padding
        self.leftViewMode = .always
        //self.layer.borderColor = (UIColor(named: "fucsiaVentax") as! CGColor)
    }
}

/*
self.backgroundColor  = UIColor.white
self.layer.cornerRadius = 10
self.setTitleColor(UIColor.black, for: .normal)
self.layer.shadowColor = UIColor.black.cgColor
self.layer.shadowRadius = 4
self.layer.shadowOpacity = 1
self.layer.shadowOffset = CGSize(width: 0, height: 0)
self.showsTouchWhenHighlighted = true
*/
