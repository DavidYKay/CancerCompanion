//
//  TimelineViewController.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/25/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import UIKit
import SwiftEventBus

class TimelineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Timeline"

	SwiftEventBus.onMainThread(self, name: "CT Scan") { result in

        }
        
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Notification", style: .Plain, target: self, action: "onScheduleNotification")
    }

    func onScheduleNotification() {
        println("onScheduleNotification")
        
          let t = NSTimer.scheduledTimerWithTimeInterval(5.0,
            target: self, 
            selector:Selector("onFireNotification"),
        userInfo: nil,
            repeats:false)

    }

    func onFireNotification() {
        println("onFireNotification")
      //NotificationService().scheduleNotification()
      NotificationService().showNotification()
    }

    @IBAction func onShowEmotionPressed(sender: AnyObject) {
        let vc = EmotionalCheckinViewController(nibName: "EmotionalCheckinViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)


    }
    
    @IBAction func onShowSurveyPressed(sender: AnyObject) {
        let vc = ChecklistViewController(nibName: "ChecklistViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

