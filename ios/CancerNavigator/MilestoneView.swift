//
//  MilestoneView.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/26/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import UIKit
import SwiftEventBus

public class MilestoneView : UIView {
    
  @IBOutlet weak var nameButton: UIButton!
  @IBOutlet weak var checkmarkButton: UIButton!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var minorNameLabel: UILabel!
  @IBOutlet weak var dateDividingLine: UIView!
  @IBOutlet weak var verticalLine: UIView!
  @IBOutlet weak var arrow: UIView!
  
  var containerView: UIView!

  public func updateView() {
      if (milestone != nil) {
        let unwrapped = milestone!

        switch unwrapped.type {
          case .Major:
            verticalLine.hidden = false
            arrow.hidden = true
            minorNameLabel.hidden = true
            nameButton.hidden = false
            nameButton.setTitle(unwrapped.name, forState: UIControlState.Normal)
          case .Minor:
            verticalLine.hidden = true
            arrow.hidden = false
            minorNameLabel.hidden = false
            minorNameLabel.text = unwrapped.name
            nameButton.hidden = true
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

        checkmarkButton.hidden = false
        switch unwrapped.checkmark {
          case .None:
            checkmarkButton.hidden = true
          case .Pending:
            checkmarkButton.hidden = false
            let image = UIImage(named: "CheckGrey.png")
            checkmarkButton.setImage(image, forState: UIControlState.Normal)
          case .Completed:
            checkmarkButton.hidden = false
            let image = UIImage(named: "CheckGreen.png")
            checkmarkButton.setImage(image , forState: UIControlState.Normal)
        }
      }
  }

  var milestone: Milestone? {
    didSet {
      updateView()
    }
  }

    class func create() -> MilestoneView {
        let options: [NSObject : AnyObject] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
     	let views = NSBundle.mainBundle().loadNibNamed("MilestoneView", owner: nil, options: options)
        let milestoneView = views[0] as! MilestoneView

        return milestoneView
    }
    
    func baseInit() {
        print("milestoneView.baseInit()")

        SwiftEventBus.onMainThread(self, name: "UpdateUI") { result in
            self.updateView()
       }
    }
        
    required public init?(coder aDecoder: NSCoder) {
        print("MilestoneView initWithCoder")
      super.init(coder: aDecoder)
      baseInit()
    }
    
    override init(frame: CGRect) {
        print("MilestoneView initWithFrame")
      super.init(frame: frame)

      baseInit()
    }
    
    public override func layoutSubviews() {
      super.layoutSubviews()
      print("MilestoneView layoutSubviews()")
        
    }
    
    func handleButtonPress() {
      let name = milestone?.name
      SwiftEventBus.post(name!)
    }

    @IBAction func nameWasPressed(sender: AnyObject) {
        print("nameWasPressed: \(self.milestone?.name)")
        handleButtonPress()
    }
    
    @IBAction func checkmarkWasPressed(sender: AnyObject) {
        print("checkmarkWasPressed: \(self.milestone?.name)")
        handleButtonPress()
    }

}
