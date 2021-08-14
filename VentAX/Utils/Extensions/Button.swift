//
//  Button.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 05/04/21.
//

import UIKit

extension UIButton{
    
    
    
    func designLogin(){
        self.backgroundColor  = UIColor.white
        self.layer.cornerRadius = 7
        self.setTitleColor(UIColor.black, for: .normal)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.showsTouchWhenHighlighted = true
    }
    
    func designButton1(){
        self.backgroundColor  = UIColor.white
        self.layer.cornerRadius = 5
        //self.setTitleColor(UIColor.black, for: .normal)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: -3, height: 3)
        self.showsTouchWhenHighlighted = true
    }
    func designButton2(){//add/edit
        self.backgroundColor  = UIColor.white
        self.layer.cornerRadius = 5
        //self.setTitleColor(UIColor.black, for: .normal)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: -3, height: 3)
        self.showsTouchWhenHighlighted = true
        self.setTitleColor(UIColor(named: Colors.blueVentax), for: .normal)
    }
    func designButton3(){//delete
        self.backgroundColor  = UIColor.white
        self.layer.cornerRadius = 5
        //self.setTitleColor(UIColor.black, for: .normal)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: -3, height: 3)
        self.showsTouchWhenHighlighted = true
        self.setTitleColor(UIColor(named: Colors.redVentax), for: .normal)
    }
}


class XButton: UIButton{
    var socialMediaCode:String?
    var socialMediaId:Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
