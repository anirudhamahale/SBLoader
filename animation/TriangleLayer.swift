//
//  TriangleLayer.swift
//  animation
//
//  Created by LA Argon on 12/9/16.
//  Copyright © 2016 com.letsappit. All rights reserved.
//

import UIKit

class TriangleLayer: CAShapeLayer {
    let innerPadding: CGFloat = 30.0
    
    override init() {
        super.init()
        fillColor = Colors.red.CGColor
        strokeColor = Colors.red.CGColor
        lineWidth = 7.0
        lineCap = kCALineCapRound
        lineJoin = kCALineJoinRound
        path = trianglePathSmall.CGPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var trianglePathSmall: UIBezierPath {
        let trianglePath = UIBezierPath()
        trianglePath.moveToPoint(CGPoint(x: 5.0 + innerPadding, y: 95.0))
        trianglePath.addLineToPoint(CGPoint(x: 50.0, y: 12.5 + innerPadding))
        trianglePath.addLineToPoint(CGPoint(x: 95.0 - innerPadding, y: 95.0))
        trianglePath.closePath()
        return trianglePath
    }
    
    var trianglePathLeftExtension: UIBezierPath {
        let trianglePath = UIBezierPath()
        trianglePath.moveToPoint(CGPoint(x: 5.0, y: 95.0))
        trianglePath.addLineToPoint(CGPoint(x: 50.0, y: 12.5 + innerPadding))
        trianglePath.addLineToPoint(CGPoint(x: 95.0 - innerPadding, y: 95.0))
        trianglePath.closePath()
        return trianglePath
    }
    
    var trianglePathRightExtension: UIBezierPath {
        let trianglePath = UIBezierPath()
        trianglePath.moveToPoint(CGPoint(x: 5.0, y: 95.0))
        trianglePath.addLineToPoint(CGPoint(x: 50.0, y: 12.5 + innerPadding))
        trianglePath.addLineToPoint(CGPoint(x: 95.0, y: 95.0))
        trianglePath.closePath()
        return trianglePath
    }
    
    var trianglePathTopExtension: UIBezierPath {
        let trianglePath = UIBezierPath()
        trianglePath.moveToPoint(CGPoint(x: 5.0, y: 95.0))
        trianglePath.addLineToPoint(CGPoint(x: 50.0, y: 12.5))
        trianglePath.addLineToPoint(CGPoint(x: 95.0, y: 95.0))
        trianglePath.closePath()
        return trianglePath
    }
    
    func animate() {
        let triangleLeftAnimation = CABasicAnimation(keyPath: "path")
        triangleLeftAnimation.fromValue = trianglePathSmall.CGPath
        triangleLeftAnimation.toValue = trianglePathLeftExtension.CGPath
        triangleLeftAnimation.beginTime = 0.0
        triangleLeftAnimation.duration = 0.3
        
        let triangleRightAnimation = CABasicAnimation(keyPath: "path")
        triangleRightAnimation.fromValue = trianglePathLeftExtension.CGPath
        triangleRightAnimation.toValue = trianglePathRightExtension.CGPath
        triangleRightAnimation.beginTime = triangleLeftAnimation.beginTime + triangleLeftAnimation.duration
        triangleRightAnimation.duration = 0.25
        
        let triangleTopAnimation = CABasicAnimation(keyPath: "path")
        triangleTopAnimation.fromValue = trianglePathRightExtension.CGPath
        triangleTopAnimation.toValue = trianglePathTopExtension.CGPath
        triangleTopAnimation.beginTime = triangleRightAnimation.beginTime + triangleRightAnimation.duration
        triangleTopAnimation.duration = 0.20
        
        let triangleAnimationGroup = CAAnimationGroup()
        triangleAnimationGroup.animations = [triangleLeftAnimation, triangleRightAnimation, triangleTopAnimation]
        triangleAnimationGroup.duration = triangleTopAnimation.beginTime + triangleTopAnimation.duration
        triangleAnimationGroup.fillMode = kCAFillModeForwards
        triangleAnimationGroup.removedOnCompletion = false
        addAnimation(triangleAnimationGroup, forKey: nil)
    }
}









