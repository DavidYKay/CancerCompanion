//
//  MilestoneView.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/26/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import Foundation

class MilestoneView : UIView {
    
    var milestone: Milestone

    var nameLabel: UILabel
    var dayLabel: UILabel
    var checkmarkView: UIButton
    
    func baseInit() {
	let label = UILabel()
	label.text = milestone.name

	label.transform = CGAffineTransformMakeRotation(CGFloat(degreesToRadians(-45)))
	self.addSubview(label)
	self.milestoneLabels.append(label)
    }
        
    required public init(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      baseInit()
    }
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      baseInit()
    }
    
    public override func layoutSubviews() {

      let interval: CGFloat = 40
      var yOffset: CGFloat = 0
      let xPos: CGFloat = 0
      let StandardWidth: CGFloat = 120
      let StandardHeight: CGFloat = 40
      for label in milestoneLabels {
          label.frame = CGRect(x: xPos, y: yOffset, width: StandardWidth, height: StandardHeight)
          yOffset += interval
      }


    }

}
