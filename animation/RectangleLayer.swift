//
//  RectangleLayer.swift
//  animation
//
//  Created by LA Argon on 12/9/16.
//  Copyright © 2016 com.letsappit. All rights reserved.
//

import UIKit

class RectangleLayer: CAShapeLayer {
    
    override init() {
        super.init()
        fillColor = Colors.clear.CGColor
        lineWidth = 5.0
        path = rectanglePathFull.CGPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var rectanglePathFull: UIBezierPath {
        let rectanglePath = UIBezierPath()
        rectanglePath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
        rectanglePath.addLineToPoint(CGPoint(x: 0.0, y: -lineWidth))
        rectanglePath.addLineToPoint(CGPoint(x: 100.0, y: -lineWidth))
        rectanglePath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
        rectanglePath.addLineToPoint(CGPoint(x: -lineWidth / 2, y: 100.0))
        rectanglePath.closePath()
        return rectanglePath
    }
    
    func animateStrokeWithColor(color: UIColor) {
        strokeColor = color.CGColor
        let strokeAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeAnimation.fromValue = 0.0
        strokeAnimation.toValue = 1.0
        strokeAnimation.duration = 0.4
        addAnimation(strokeAnimation, forKey: nil)

    }
    
}