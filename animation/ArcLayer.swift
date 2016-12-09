//
//  ArcLayer.swift
//  animation
//
//  Created by LA Argon on 12/9/16.
//  Copyright © 2016 com.letsappit. All rights reserved.
//

import UIKit

class ArcLayer: CAShapeLayer {

    let animationDuration: CFTimeInterval = 0.18
    
    override init() {
        super.init()
        fillColor = Colors.blue.CGColor
        path = arcPathStarting.CGPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var arcPathPre: UIBezierPath {
        let arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 99.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: 99.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.closePath()
        return arcPath
    }
    
    var arcPathStarting: UIBezierPath {
        let arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 80.0))
        arcPath.addCurveToPoint(CGPoint(x: 100.0, y: 80.0), controlPoint1: CGPoint(x: 30.0, y: 70.0), controlPoint2: CGPoint(x: 40.0, y: 90.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.closePath()
        return arcPath
    }
    
    var arcPathLow: UIBezierPath {
        let arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 60.0))
        arcPath.addCurveToPoint(CGPoint(x: 100.0, y: 60.0), controlPoint1: CGPoint(x: 30.0, y: 65.0), controlPoint2: CGPoint(x: 40.0, y: 50.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.closePath()
        return arcPath
    }
    
    var arcPathMid: UIBezierPath {
        let arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 40.0))
        arcPath.addCurveToPoint(CGPoint(x: 100.0, y: 40.0), controlPoint1: CGPoint(x: 30.0, y: 30.0), controlPoint2: CGPoint(x: 40.0, y: 50.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.closePath()
        return arcPath
    }
    
    var arcPathHigh: UIBezierPath {
        let arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 20.0))
        arcPath.addCurveToPoint(CGPoint(x: 100.0, y: 20.0), controlPoint1: CGPoint(x: 30.0, y: 25.0), controlPoint2: CGPoint(x: 40.0, y: 10.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.closePath()
        return arcPath
    }
    
    var arcPathComplete: UIBezierPath {
        let arcPath = UIBezierPath()
        arcPath.moveToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: -5.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: -5.0))
        arcPath.addLineToPoint(CGPoint(x: 100.0, y: 100.0))
        arcPath.addLineToPoint(CGPoint(x: 0.0, y: 100.0))
        arcPath.closePath()
        return arcPath
    }
    
    func animate() {
        let arcPreAnimation = CABasicAnimation(keyPath: "path")
        arcPreAnimation.fromValue = arcPathPre.CGPath
        arcPreAnimation.toValue = arcPathStarting.CGPath
        arcPreAnimation.beginTime = 0.0
        arcPreAnimation.duration = animationDuration
        
        let arcLowAnimation = CABasicAnimation(keyPath: "path")
        arcLowAnimation.fromValue = arcPathStarting.CGPath
        arcLowAnimation.toValue = arcPathLow.CGPath
        arcLowAnimation.beginTime = arcPreAnimation.beginTime + arcPreAnimation.duration
        arcLowAnimation.duration = animationDuration
        
        let arcMidAnimation = CABasicAnimation(keyPath: "path")
        arcMidAnimation.fromValue = arcPathLow.CGPath
        arcMidAnimation.toValue = arcPathLow.CGPath
        arcMidAnimation.beginTime = arcLowAnimation.beginTime + arcLowAnimation.duration
        arcMidAnimation.duration = animationDuration
        
        let arcHighAnimation = CABasicAnimation(keyPath: "path")
        arcHighAnimation.fromValue = arcPathLow.CGPath
        arcHighAnimation.toValue = arcPathHigh.CGPath
        arcHighAnimation.beginTime = arcMidAnimation.beginTime + arcMidAnimation.duration
        arcHighAnimation.duration = animationDuration
        
        let arcCompleteAnimation = CABasicAnimation(keyPath: "path")
        arcCompleteAnimation.fromValue = arcPathHigh.CGPath
        arcCompleteAnimation.toValue = arcPathComplete.CGPath
        arcCompleteAnimation.beginTime = arcHighAnimation.beginTime + arcHighAnimation.duration
        arcCompleteAnimation.duration = animationDuration
        
        let arcAnimationGroup = CAAnimationGroup()
        arcAnimationGroup.animations = [ arcPreAnimation, arcLowAnimation, arcMidAnimation, arcHighAnimation, arcCompleteAnimation ]
        arcAnimationGroup.duration = arcCompleteAnimation.beginTime + arcCompleteAnimation.duration
        arcAnimationGroup.fillMode = kCAFillModeForwards
        arcAnimationGroup.removedOnCompletion = false
        addAnimation(arcAnimationGroup, forKey: nil)
    }
}





















