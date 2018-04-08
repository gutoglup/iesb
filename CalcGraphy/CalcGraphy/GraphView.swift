//
//  GraphView.swift
//  CalcGraphy
//
//  Created by Augusto Reis on 27/03/2018.
//  Copyright © 2018 Augusto Reis. All rights reserved.
//

import UIKit

protocol GraphDelegate: class {
    func requestY(toX: Double) -> Double
}

@IBDesignable
class GraphView: UIView {

    weak var delegate: GraphDelegate?
    
    @IBInspectable
    var scale: CGFloat = 1{
        didSet{
            setNeedsDisplay()
        }
    }

    var originOfGraph: CGPoint? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var centerOfGraph: CGPoint {
        if let originOfGraph = originOfGraph {
            return convert(originOfGraph, to: self)
        }
        return convert(center, to: self)
    }
    
    override func draw(_ rect: CGRect) {
        let lineGraph = UIBezierPath()
        
        var firstPoint = true
        
        for xValue in Int(bounds.minX)...Int(bounds.maxX) {
            if let originOfGraph = originOfGraph {
                let graphX = (Double(xValue)-Double(originOfGraph.x))/Double(scale)
                let yValue = self.delegate?.requestY(toX: graphX)
                let yPoint = originOfGraph.y - CGFloat(yValue!) * scale
                let point = CGPoint(x: CGFloat(xValue), y: CGFloat(yPoint))
                if firstPoint {
                    lineGraph.move(to: point)
                    firstPoint = false
                } else {
                    lineGraph.addLine(to: point)
                }
            }
            
        }
        UIColor.blue.setStroke()
        lineGraph.lineWidth = 1
        lineGraph.stroke()
        
        let axesView = AxesDrawer(color: .red, contentScaleFactor: scale)
        if let originOfGraph = originOfGraph {
            axesView.drawAxes(in: bounds, origin: originOfGraph, pointsPerUnit: scale)
        }
    }
 
    private func discoverCoordinateAxis(x: CGFloat, origin: CGPoint, scale: CGFloat) -> CGFloat {
        return (x - origin.x) / scale
    }
    

}
