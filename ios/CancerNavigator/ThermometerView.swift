//
//  ThermometerView.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/26/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import UIKit


class ThermometerView: UIView {
    
    var numberLabels: [UILabel]!
    let thermometerGradient = ColorService().dynamicGradiant(UIColor.greenColor(), toColor: UIColor.redColor())
    
    let StandardHeight = 20
    let StandardWidth  = 20

    func baseInit() {
        let rgLayer = ColorService().thermometerGradient()
        rgLayer.frame = self.bounds;

        let numbers = 1...10
        self.numberLabels = numbers.map { 
          let label = UILabel()
          label.text = $0.description
          label.tag = $0
          return label
        }

        for label in numberLabels {
          self.addSubview(label)
        }

        self.layer.insertSublayer(rgLayer, atIndex:0)
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

        var yOffset = 0
        for label in self.numberLabels {
          label.frame = CGRect(x: 1, y: yOffset, width: StandardWidth, height: StandardHeight)
            yOffset += StandardHeight
        }
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
