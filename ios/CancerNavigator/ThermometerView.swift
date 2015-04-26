//
//  ThermometerView.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/26/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import UIKit


class ThermometerView: UIView {
    
    
    let thermometerGradient = ColorService().dynamicGradiant(UIColor.greenColor(), toColor: UIColor.redColor())

    func baseInit() {
        
    }
        
    required init(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      baseInit()
    }
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      baseInit()
    }
    
    override func layoutSubviews() {
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {

    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {

    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        
    }
    
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        
    }

}
