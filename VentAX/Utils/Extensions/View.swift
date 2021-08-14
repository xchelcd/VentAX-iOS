//
//  View.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 11/04/21.
//

import Foundation
import UIKit

extension UIView{
    func designBorder(){
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor(named: Colors.grayScheduleVentax)?.cgColor
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}
