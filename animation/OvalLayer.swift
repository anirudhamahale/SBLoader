//
//  OvalLayer.swift
//  animation
//
//  Created by LA Argon on 12/9/16.
//  Copyright © 2016 com.letsappit. All rights reserved.
//

import UIKit

class OvalLayer: CAShapeLayer {
    let animationDuration: CFTimeInterval = 0.3
    
    override init() {
        super.init()
        fillColor = Colors.red.CGColor
        path = ovalPathSmall.CGPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var ovalPathSmall: UIBezierPath {
        return UIBezierPath(ovalInRect: CGRect(x: 50.0, y: 50.0, width: 0, height: 0))
    }
    
    var ovalPathLarge: UIBezierPath {
        return UIBezierPath(ovalInRect: CGRect(x: 2.5, y: 17.5, width: 95.0, height: 95.0))
    }
    
    var ovalPathSquishVertical: UIBezierPath {
        return UIBezierPath(ovalInRect: CGRect(x: 2.5, y: 20.0, width: 95.0, height: 90.0))
    }
    
    var ovalPathSquishHorizontal: UIBezierPath {
        return UIBezierPath(ovalInRect: CGRect(x: 5.0, y: 20.0, width: 90.0, height: 90.0))
    }
    
    func expand() {
        let expandAnimation = CABasicAnimation(keyPath: "path")
        expandAnimation.fromValue = ovalPathSmall.CGPath
        expandAnimation.toValue = ovalPathLarge.CGPath
        expandAnimation.duration = animationDuration
        expandAnimation.fillMode = kCAFillModeForwards
        expandAnimation.removedOnCompletion = false
        addAnimation(expandAnimation, forKey: nil)
    }
    
    func wooble() {
        let wa1 = CABasicAnimation(keyPath: "path")
        wa1.fromValue = ovalPathLarge.CGPath
        wa1.toValue = ovalPathSquishVertical.CGPath
        wa1.beginTime = 0.0
        wa1.duration = animationDuration
        
        let wa2 = CABasicAnimation(keyPath: "path")
        wa2.fromValue = ovalPathSquishVertical.CGPath
        wa2.toValue = ovalPathSquishHorizontal.CGPath
        wa2.beginTime = wa1.beginTime + wa1.duration
        wa2.duration = animationDuration
        
        let wa3 = CABasicAnimation(keyPath: "path")
        wa3.fromValue = ovalPathSquishHorizontal.CGPath
        wa3.toValue = ovalPathSquishVertical.CGPath
        wa3.beginTime = wa2.beginTime + wa2.duration
        wa2.duration = animationDuration
        
        let wa4 = CABasicAnimation(keyPath: "path")
        wa4.fromValue = ovalPathSquishVertical.CGPath
        wa4.toValue = ovalPathLarge.CGPath
        wa4.beginTime = wa3.beginTime + wa3.duration
        wa4.duration = animationDuration
        
        let woobleAnimationGroup = CAAnimationGroup()
        woobleAnimationGroup.animations = [wa1, wa2, wa3, wa4]
        woobleAnimationGroup.duration = wa4.beginTime + wa4.duration
        woobleAnimationGroup.repeatCount = 2
        addAnimation(woobleAnimationGroup, forKey: nil)
    }
    
    func contract() {
        let contract = CABasicAnimation(keyPath: "path")
        contract.fromValue = ovalPathLarge.CGPath
        contract.toValue = ovalPathSmall.CGPath
        contract.duration = animationDuration
        contract.fillMode = kCAFillModeForwards
        contract.removedOnCompletion = false
        addAnimation(contract, forKey: nil)
    }
    
    
    
    
    
}



















