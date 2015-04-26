//
//  MilestoneView.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/26/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import UIKit

public class MilestoneView : UIView {
    
    var milestone: Milestone?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var checkmarkButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateDividingLine: UIView!

    var containerView: UIView!

    class func create() -> MilestoneView {
        let options: [NSObject : AnyObject] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
     	let views = NSBundle.mainBundle().loadNibNamed("MilestoneView", owner: nil, options: options)
        let milestoneView = views[0] as! MilestoneView

        return milestoneView
    }
    
    func baseInit() {

        println("milestoneView.baseInit()")
        //let options: [NSObject : AnyObject] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
     	//let views = NSBundle.mainBundle().loadNibNamed("MilestoneView", owner: self, options: options)
        //let loadedView: UIView = views[0] as! UIView
        //for view in loadedView.subviews {
        //  self.addSubview(view)
        //}

	//let label = UILabel()
        //label.transform = CGAffineTransformMakeRotation(CGFloat(degreesToRadians(-45)))
    }
        
    required public init(coder aDecoder: NSCoder) {
        println("MilestoneView initWithCoder")
      super.init(coder: aDecoder)
      baseInit()
    }
    
    override init(frame: CGRect) {
        println("MilestoneView initWithFrame")
      super.init(frame: frame)

//        let options: [NSObject : AnyObject] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//     	let views = NSBundle.mainBundle().loadNibNamed("MilestoneView", owner: self, options: options)
//        self.containerView = views[0] as! UIView
//        self.addSubview(self.containerView)

      baseInit()
    }
    
    public override func layoutSubviews() {
      super.layoutSubviews()
      println("MilestoneView layoutSubviews()")
        
//        self.containerView.setNeedsLayout()

    }

    //  let interval: CGFloat = 40
    //  var yOffset: CGFloat = 0
    //  let xPos: CGFloat = 0
    //  let StandardWidth: CGFloat = 120
    //  let StandardHeight: CGFloat = 40

    //  label.frame = CGRect(x: xPos, y: yOffset, width: StandardWidth, height: StandardHeight)

    //    //yOffset += interval


    //}

}
