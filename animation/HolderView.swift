//
//  HolderView.swift
//  animation
//
//  Created by LA Argon on 12/9/16.
//  Copyright © 2016 com.letsappit. All rights reserved.
//

import UIKit

//protocol HolderViewDelegate:class {
//    func animateLabel()
//}

class HolderView: UIView {
    
    let ovalLayer = OvalLayer()
    let triangleLayer = TriangleLayer()
    
    let redRectangleLayer = RectangleLayer()
    let blueRectangleLayer = RectangleLayer()
    
    let arcLayer = ArcLayer()
    
    
    var parentFrame :CGRect = CGRectZero
//    weak var delegate:HolderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addOval() {
        layer.addSublayer(ovalLayer)
        ovalLayer.expand()
        NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(HolderView.woobleOval), userInfo: nil, repeats: false)
    }
    
    func woobleOval() {
        layer.addSublayer(triangleLayer)
        ovalLayer.wooble()
        NSTimer.scheduledTimerWithTimeInterval(0.9, target: self, selector: #selector(self.drawAnimatedTriangle), userInfo: nil, repeats: false)
    }
    
    func drawAnimatedTriangle() {
        triangleLayer.animate()
        NSTimer.scheduledTimerWithTimeInterval(0.9, target: self, selector: #selector(self.spinAndTransform), userInfo: nil, repeats: false)
    }
    
    func spinAndTransform() {
        layer.anchorPoint = CGPointMake(0.5, 0.6)
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = CGFloat(M_PI * 2.0)
        rotationAnimation.duration = 0.45
        rotationAnimation.removedOnCompletion = false
        layer.addAnimation(rotationAnimation, forKey: nil)
        
        ovalLayer.contract()
        
        NSTimer.scheduledTimerWithTimeInterval(0.45, target: self, selector: #selector(self.drawRedAnimatedAngle), userInfo: nil, repeats: false)
        NSTimer.scheduledTimerWithTimeInterval(0.65, target: self, selector: #selector(self.drawBlueAnimatedAngle), userInfo: nil, repeats: false)
    }
    
    func drawRedAnimatedAngle() {
        layer.addSublayer(redRectangleLayer)
        redRectangleLayer.animateStrokeWithColor(Colors.red)
    }
    
    func drawBlueAnimatedAngle() {
        layer.addSublayer(blueRectangleLayer)
        blueRectangleLayer.animateStrokeWithColor(Colors.blue)
        NSTimer.scheduledTimerWithTimeInterval(0.40, target: self, selector: #selector(self.drawArc), userInfo: nil, repeats: false)
    }
    
    func drawArc() {
        layer.addSublayer(arcLayer)
        arcLayer.animate()
    }
}







