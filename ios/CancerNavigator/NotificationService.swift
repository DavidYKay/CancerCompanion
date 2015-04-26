//
//  NotificationService.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/26/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import UIKit
import SwiftEventBus


public class NotificationService  {
 
  let stringService: StringService = StringService()
    
    public func showNotification() {
        println("showNotification()")
	
        SwiftEventBus.post("ShowReminder")
    }

  func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
    println("clicked button: \(buttonIndex)")
      SocketService().logAppointmentConfirmed()
  }

  public func scheduleNotification() {
    println("scheduleNotification()")
    let date = NSDate(timeIntervalSinceNow: 5)

    let localNotification: UILocalNotification = UILocalNotification()
    localNotification.fireDate = date
    localNotification.alertBody = "Hello world"
    localNotification.alertAction = "Show me the item"

    UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
  }
}
