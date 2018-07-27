//
//  JHView.swift
//  UIBezierPath
//
//  Created by HWA on 2018/7/25.
//  Copyright © 2018年 HWA. All rights reserved.
//

import UIKit

class JHView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        let b = UIBezierPath(roundedRect: rect, cornerRadius: 5.0)
        
        let shape = CAShapeLayer.init()
        
        shape.fillColor = UIColor.red.cgColor
        shape.shadowRadius = 3
        shape.shadowColor = UIColor.yellow.cgColor
        shape.shadowOpacity = 0.5
        shape.shadowOffset = CGSize(width: 5, height: 5)
        
        shape.path = b.cgPath
        self.layer.addSublayer(shape)

    }
 

}
