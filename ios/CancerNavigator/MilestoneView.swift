//
//  MilestoneView.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/26/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import UIKit

public class MilestoneView : UIView {
    
//    var milestone: Milestone?

  var milestone: Milestone? {
    didSet {
      if (milestone != nil) {
        let unwrapped = milestone!

        switch unwrapped.type {
          case .Major:
            println("major")
          case .Minor:
              println("minor")
        }

        if (unwrapped.day != nil) {
          dateLabel.hidden = false
          dateLabel.text = unwrapped.day
        } else {
          dateLabel.hidden = true
        }

        if (unwrapped.time != nil) {
          timeLabel.hidden = false
          timeLabel.text = unwrapped.time
        } else {
          timeLabel.hidden = true
        }

        switch unwrapped.checkmark {
          case .None:
            println("None")
          case .Pending:
              println("Pending")
          case .Completed:
                println("Completed")
        }
      }
    }
  }

   // @IBOutlet weak var nameLabel: UILabel!
   // @IBOutlet weak var checkmarkButton: UIButton!
   // @IBOutlet weak var dateLabel: UILabel!
   // @IBOutlet weak var timeLabel: UILabel!
   // @IBOutlet weak var dateDividingLine: UIView!
    
    //@IBOutlet var nameLabel: UILabel!
    @IBOutlet var nameButton: UIButton!
    @IBOutlet var checkmarkButton: UIButton!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var dateDividingLine: UIView!
    
    var containerView: UIView!

    class func create() -> MilestoneView {
        let options: [NSObject : AnyObject] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
     	let views = NSBundle.mainBundle().loadNibNamed("MilestoneView", owner: nil, options: options)
        let milestoneView = views[0] as! MilestoneView

        return milestoneView
    }
    
    func baseInit() {
        println("milestoneView.baseInit()")

    }
        
    required public init(coder aDecoder: NSCoder) {
        println("MilestoneView initWithCoder")
      super.init(coder: aDecoder)
      baseInit()
    }
    
    override init(frame: CGRect) {
        println("MilestoneView initWithFrame")
      super.init(frame: frame)

      baseInit()
    }
    
    public override func layoutSubviews() {
      super.layoutSubviews()
      println("MilestoneView layoutSubviews()")
        
    }
    
    @IBAction func nameWasPressed(sender: AnyObject) {
        println("nameWasPressed: \(self.milestone)")
    }
    
    @IBAction func checkmarkWasPressed(sender: AnyObject) {
        println("checkmarkWasPressed: \(self.milestone)")
        
    }

}
