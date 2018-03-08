//
//  TriangleView.swift
//  DesenhoView
//
//  Created by Augusto Reis on 28/02/2018.
//  Copyright © 2018 Augusto Reis. All rights reserved.
//

import UIKit

@IBDesignable
class TriangleView: UIView {

    @IBInspectable
    var fillColor: UIColor = .black
    
    @IBInspectable
    var strokeColor: UIColor = .red
    
    @IBInspectable
    var lineWidth: CGFloat = 3
    
    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.midX, y: lineWidth))
        path.addLine(to: CGPoint(x: lineWidth, y: rect.size.height-lineWidth))
        path.addLine(to: CGPoint(x: rect.size.width-lineWidth, y: rect.size.height-lineWidth))

        path.close()
        path.lineWidth = lineWidth
        
        strokeColor.setStroke()
        fillColor.setFill()
        path.stroke()
        path.fill()
    }
    
    
 

}
