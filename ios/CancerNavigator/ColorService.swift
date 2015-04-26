//
//  ColorService.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/26/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import UIKit

typealias DynamicGradient = Double -> UIColor

class ColorService {

  func dynamicGradiant(fromColor: UIColor, toColor: UIColor) -> DynamicGradient {

    var fromRGBA = [CGFloat](count: 4, repeatedValue: 0.0)
      var toRGBA = [CGFloat](count: 4, repeatedValue: 0.0)

      fromColor.getRed(&fromRGBA[0], green: &fromRGBA[1], blue: &fromRGBA[2], alpha: &fromRGBA[3])
      toColor.getRed(&toRGBA[0], green: &toRGBA[1], blue: &toRGBA[2], alpha: &toRGBA[3])

      return { (input) in
        var colorComponentsForSuppliedValue = fromRGBA

          for var index = 0; index < fromRGBA.count; index++ {
            let span = (toRGBA[index] - fromRGBA[index]) * CGFloat(input)
              colorComponentsForSuppliedValue[index] += span
          }

        return UIColor(red: colorComponentsForSuppliedValue[0], green: colorComponentsForSuppliedValue[1], blue: colorComponentsForSuppliedValue[2], alpha: colorComponentsForSuppliedValue[3])
      }

  }
    
    func blueGradient() -> CAGradientLayer {
    
      let colorOne = UIColor(red:(120/255.0), green:(135/255.0), blue:(150/255.0), alpha:1.0)
      let colorTwo = UIColor(red:(57/255.0) , green:(79/255.0) , blue:(96/255.0) , alpha:1.0)
      
      let colors = [colorOne.CGColor, colorTwo.CGColor]
      let stopOne = NSNumber(double:0.0)
      let stopTwo = NSNumber(double:1.0)
      
      let locations = [ stopOne, stopTwo];
      
      let headerLayer: CAGradientLayer = CAGradientLayer()
      headerLayer.colors = colors;
      headerLayer.locations = locations;
      
      return headerLayer;
    
    }

    
//  let thermometerGradient = dynamicGradiant(UIColor.greenColor(), UIColor.redColor())
}



////A simple gradient:
//let gradient = dynamicGradiant(UIColor.greenColor(), UIColor.redColor())
//
//for var y = 0.0; y < 1.0; y+=0.10 {
//    gradient(y)
//}
