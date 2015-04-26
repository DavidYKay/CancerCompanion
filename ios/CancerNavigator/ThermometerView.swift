//
//  ThermometerView.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/26/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import UIKit

public protocol ThermometerListener {
    func onNewThermometerValue(thermometerValue: Int)
}

public class ThermometerView: UIView {
    
    public var listener: ThermometerListener?
    var numberLabels: [UILabel]!
    var valueLabel: UILabel!
    let thermometerGradient = ColorService().dynamicGradiant(UIColor.greenColor(), toColor: UIColor.redColor())
    
    let StandardHeight:CGFloat = 20
    let StandardWidth:CGFloat  = 20
    let NumValues = 10
    let CgZero:CGFloat = 0
    
    let ColorInset:CGFloat = 40

    func baseInit() {
        let rgLayer = ColorService().thermometerGradient()

        let numbers = 1...10
        self.numberLabels = numbers.map { 
          let label = UILabel()
          label.text = $0.description
          label.tag = $0
          return label
        }
        self.numberLabels = reverse(self.numberLabels)

        for label in numberLabels {
          self.addSubview(label)
        }

        self.valueLabel = UILabel()
        self.valueLabel.text = "Current Value: X"

        rgLayer.frame = self.bounds;
        rgLayer.frame = CGRect(x: ColorInset, y: CgZero, width: self.bounds.size.width - (2 * ColorInset), height: self.bounds.size.height)
        self.layer.insertSublayer(rgLayer, atIndex:0)
    }
        
    required public init(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      baseInit()
    }
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      baseInit()
    }

    func yInterval() -> CGFloat {
      return self.frame.size.height / 10
    }
    
    public override func layoutSubviews() {

        var yOffset:CGFloat = 0
        let interval:CGFloat = yInterval()
        let xPos:CGFloat = 0
        for label in self.numberLabels {
          label.frame = CGRect(x: xPos, y: yOffset, width: StandardWidth, height: StandardHeight)
          yOffset += interval
        }

        self.valueLabel.frame = CGRect(x: -20, y: -20, width: 40, height: StandardHeight)
    }
    
    func yPosToThermometerValue(yPos: CGFloat) -> Int {
        let baseline:CGFloat = 0
        let deltaY = yPos - baseline

        if (deltaY < 0) {
          return 10
        } else if (deltaY > self.frame.size.height) {
          return 1
        } else {
          let tentative = 11 - (deltaY / yInterval())
          return Int(tentative)
        }
    }

    func handleTouchAtLocation(touchLocation: CGPoint) {
      let thermValue = yPosToThermometerValue(touchLocation.y)
      listener?.onNewThermometerValue(thermValue)

      //println("thermValue: \(thermValue)")
      //println("\(touchLocation.x) \(touchLocation.y)")
    }

    func handleTouches(touches: Set<NSObject>) {
      let touch: UITouch = touches.first as! UITouch
      let touchLocation = touch.locationInView(self)
      handleTouchAtLocation(touchLocation)
    }
    
    public override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
      handleTouches(touches)
    }
    
    public override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
      handleTouches(touches)
    }
    
    public override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
      handleTouches(touches)
    }
    
    public override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        
    }

}
