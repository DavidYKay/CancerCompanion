//
//  TimelineView.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/26/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import UIKit

enum Checkmark {
    case None
    case Pending
    case Completed
}

enum MilestoneType {
    case Major
    case Minor
}

struct Milestone {
    var type: MilestoneType
    var name: String
    var day: String?
    var time: String?
    var checkmark: Checkmark
}

public class TimelineView : UIScrollView {

    var milestoneViews: [MilestoneView]!
    
    func baseInit() {
      let milestones = [
        Milestone(type: MilestoneType.Major , name: "Diagnosis"         , day: "D1"    , time: nil    , checkmark: Checkmark.None)      , 
        Milestone(type: MilestoneType.Major , name: "Appointment"       , day: "May 1" , time: "10AM" , checkmark: Checkmark.Completed) , 
        Milestone(type: MilestoneType.Minor , name: "Appt. Reminder"    , day: nil     , time: nil    , checkmark: Checkmark.None)      , 

        Milestone(type: MilestoneType.Major , name: "CT Scan"           , day: "May 7" , time: "9AM"  , checkmark: Checkmark.Pending)   , 
        Milestone(type: MilestoneType.Minor , name: "Survey Questions"  , day: nil     , time: nil    , checkmark: Checkmark.None)      , 
        Milestone(type: MilestoneType.Major , name: "Appointment"       , day: nil     , time: nil    , checkmark: Checkmark.Pending)   , 
        Milestone(type: MilestoneType.Minor , name: "Emotional Checkin" , day: nil     , time: nil    , checkmark: Checkmark.None)      , 

        //// Long term
        Milestone(type: MilestoneType.Major , name: "Surgery"           , day: nil     , time: nil    , checkmark: Checkmark.None)      , 
        Milestone(type: MilestoneType.Major , name: "Chemo"             , day: nil     , time: nil    , checkmark: Checkmark.None)      , 
        Milestone(type: MilestoneType.Major , name: "Radiation"         , day: nil     , time: nil    , checkmark: Checkmark.None)      , 
        Milestone(type: MilestoneType.Major , name: "Medicines"         , day: nil     , time: nil    , checkmark: Checkmark.None)      , 
        Milestone(type: MilestoneType.Major , name: "Survivor"          , day: nil     , time: nil    , checkmark: Checkmark.None)      , 
      ]


        var xOffset: CGFloat = 40
        let interval: CGFloat = 120
        let yPos: CGFloat = 0
        let milestoneWidth: CGFloat = 80

        let myBoundsHeight = self.bounds.size.height - 40

        let milestoneHeight = myBoundsHeight

        self.milestoneViews = []
        for milestone in milestones {
          let milestoneView = MilestoneView.create()
          milestoneView.milestone = milestone

          // label.transform = CGAffineTransformMakeRotation(CGFloat(degreesToRadians(-45)))

          milestoneView.frame = CGRect(x: xOffset, y: yPos, width: milestoneWidth, height: milestoneHeight )

          self.addSubview(milestoneView)
          self.milestoneViews.append(milestoneView)

          xOffset += interval
        }
        
      let contentWidth: CGFloat = interval * CGFloat(milestones.count)
      let contentHeight: CGFloat = myBoundsHeight
      self.contentSize = CGSize(width: contentWidth, height: contentHeight)
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
//      for label in milestoneLabels {
//          label.frame = CGRect(x: xPos, y: yOffset, width: StandardWidth, height: StandardHeight)
//          yOffset += interval
//      }

//      let milestoneWidth: CGFloat = 76
//      milestoneView.frame = CGRect(x: 0,y: 0, width: milestoneWidth, height: 200)
//        milestoneView.setNeedsLayout()
    }

    // func handleTouches(touches: Set<NSObject>) {

    // }
    // 
    // override public func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
    //   handleTouches(touches)
    // }
    // 
    // override public func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
    //   handleTouches(touches)
    // }
    // 
    // override public func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
    //   handleTouches(touches)
    // }
    // 
    // override public func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
    //     
    // }
        
}
