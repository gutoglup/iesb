//
//  BugView.swift
//  BugDraw
//
//  Created by Augusto Reis on 05/03/2018.
//  Copyright © 2018 Augusto Reis. All rights reserved.
//

import UIKit

@IBDesignable
class BugView: UIView {

    
    override func draw(_ rect: CGRect) {
        
        let padding : CGFloat = 50.0
        
        let path = UIBezierPath()
        
//        path.move(to: CGPoint(x: rect.midX, y: 0))
        
        path.addArc(withCenter: CGPoint(x: rect.midX, y: rect.midY + padding / 8), radius: rect.width / 4, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)

        path.move(to: CGPoint(x: rect.width * 2 / 5 + 2, y: rect.height * 2 / 8))
        path.addArc(withCenter: CGPoint(x: rect.width / 2, y: padding), radius: rect.width / 8, startAngle: -CGFloat.pi * 4 / 3, endAngle: CGFloat.pi/3, clockwise: true)
//        path.move(to: CGPoint(x: rect.width * 2 / 5 , y: rect.height / 2))
//        path.addLine(to: CGPoint(x: 10, y: 10))
        path.addArc(withCenter: CGPoint(x: rect.width * 2 / 5 , y: rect.height / 2), radius: 10, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        path.lineWidth = 3
        UIColor.black.setStroke()
        path.stroke()
        
        
    }

}
