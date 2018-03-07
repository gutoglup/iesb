//
//  StarView.swift
//  StarDraw
//
//  Created by Augusto Reis on 04/03/2018.
//  Copyright © 2018 Augusto Reis. All rights reserved.
//

import UIKit

@IBDesignable
class StarView: UIView {

    @IBInspectable
    var points: Int = 8
    
    @IBInspectable
    var distanceOfCenter: CGFloat = 30
    
    @IBInspectable
    var fillColor: UIColor = .cyan
    
    @IBInspectable
    var strokeColor: UIColor = .black
    
    @IBInspectable
    var lineWidth: CGFloat = 1.0
    
    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath()
        
        // Calculate angle in radius, set first point at 90º
        var angle = -CGFloat(Float.pi / 2)
        let angleIncrement = CGFloat(Float.pi * 2 / Float(points))
        let radius = CGFloat(rect.width) / 2
        
        // Move to initial point
        path.move(to: CGPoint(x: xPointOfCircle(radius, angle, 0, radius), y: yPointOfCircle(radius, angle, 0, radius)))
        for _ in 0 ..< points {
            addSequencePoints(path, angle, angleIncrement, rect, radius)
            angle += angleIncrement
        }
        
        path.close()
        path.lineWidth = lineWidth
        fillColor.setFill()
        strokeColor.setStroke()
        path.stroke()
        path.fill()
    }
    
    fileprivate func addSequencePoints(_ path: UIBezierPath, _ angle: CGFloat, _ angleIncrement: CGFloat, _ rect: CGRect, _ radius: CGFloat) {
        let midAngleIncrement = angleIncrement / 2
        path.addLine(to: CGPoint(x: xPointOfCircle(distanceOfCenter, angle, midAngleIncrement, radius), y: yPointOfCircle(distanceOfCenter, angle, midAngleIncrement, radius)))
        path.addLine(to: CGPoint(x: xPointOfCircle( radius, angle, angleIncrement, radius), y: yPointOfCircle(radius, angle, angleIncrement, radius)))
    }
    
    fileprivate func xPointOfCircle(_ distanceOfCenter: CGFloat, _ angle: CGFloat, _ angleIncrement: CGFloat, _ offsetCenter: CGFloat) -> CGFloat {
        print("The cos \(distanceOfCenter * cos(angle + angleIncrement) + offsetCenter)");
        return distanceOfCenter * cos(angle + angleIncrement) + offsetCenter
    }
    
    fileprivate func yPointOfCircle(_ distanceOfCenter: CGFloat, _ angle: CGFloat, _ angleIncrement: CGFloat, _ offsetCenter: CGFloat) -> CGFloat {
        print("The sin \(distanceOfCenter * sin(angle + angleIncrement) + offsetCenter)");
        return distanceOfCenter * sin(angle + angleIncrement) + offsetCenter
    }

}
