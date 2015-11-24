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
      
     SwiftEventBus.onMainThread(self, name: "ShowReminder") { result in
	print("received: ShowReminder")

	let message = StringService().getString("AppointmentReminder")

	let handler: (UIAlertAction!) -> Void = { action in
	      switch action.style{
	      case .Default:
		SocketService().logAppointmentConfirmed()
	      case .Cancel:
		print("cancel")
	      case .Destructive:
		print("destructive")
	      }
	}
	let alert = UIAlertController(title: "Reminder", message: message, preferredStyle: UIAlertControllerStyle.Alert)
	alert.addAction(UIAlertAction(title: "Confirm", style: .Default, handler: handler))
	alert.addAction(UIAlertAction(title: "Postpone", style: .Cancel, handler: handler))
	self.presentViewController(alert, animated: true, completion: nil)
      }

      SwiftEventBus.onMainThread(self, name: "Reminder") { result in
	print("received: Reminder")
	self.onScheduleNotification()
      }

    SwiftEventBus.onMainThread(self, name: "Survey") { result in
      print("received: Survey")
	self.onShowSurveyPressed(self)
    }

    SwiftEventBus.onMainThread(self, name: "Emo. Check") { result in
      print("received: Emo. Check")
	self.onShowEmotionPressed(self)
    }
  }

    func onScheduleNotification() {
        print("onScheduleNotification")
        
          _ = NSTimer.scheduledTimerWithTimeInterval(5.0,
            target: self, 
            selector:Selector("onFireNotification"),
        userInfo: nil,
            repeats:false)
    }

    func onFireNotification() {
        print("onFireNotification")
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

