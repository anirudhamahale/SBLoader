//
//  ViewController.swift
//  animation
//
//  Created by LA Argon on 12/9/16.
//  Copyright © 2016 com.letsappit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var holderView = HolderView(frame: CGRectZero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
//        print("viewDidAppear")
        addHolderView()
        holderView.addOval()
    }
    
    func addHolderView() {
        let boxSize: CGFloat = 100.0
        holderView.frame = CGRect(x: view.bounds.width/2 - boxSize/2,
                                  y: view.bounds.height/2 - boxSize/2,
                                  width: boxSize, height: boxSize)
        holderView.parentFrame = view.frame
        view.addSubview(holderView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//extension ViewController: HolderViewDelegate {
//    func animateLabel() {
//        
//    }
//
//}
//
