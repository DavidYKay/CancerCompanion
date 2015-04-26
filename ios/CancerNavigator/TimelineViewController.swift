//
//  TimelineViewController.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/25/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Timeline"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Notification", style: .Plain, target: self, action: "onFireNotification")
    }

    func onFireNotification() {
        println("onFireNotification")
        
          let t = NSTimer.scheduledTimerWithTimeInterval(5.0,
            target: self, 
            selector:Selector("onTick"),
        userInfo: nil, repeats:false)

    }

    func onTick() {
        println("onTick")
      //NotificationService().scheduleNotification()
      NotificationService().showNotification()
    }



}

