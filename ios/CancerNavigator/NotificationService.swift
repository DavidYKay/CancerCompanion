//
//  NotificationService.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/26/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import UIKit

public class NotificationService {
 
  let stringService: StringService = StringService()
    
  public func showNotification() {
    println("showNotification()")
//"AppointmentReminder" = "Your scan is scheduled for 9:00am on May 7th at 830 Main St. First floor.";
//"AppointmentReminderOK" = "Confirm";
//"AppointmentReminderCancel" = "Reschedule";
//"PopUpBoobText" = "This is where your cancer started.";
//"PopUpLymphNodeText" = "This is where your cancer spreads first.";
    
    let alert = UIAlertView(title: "Appointment Reminder",
        message: stringService.getString("AppointmentReminder"),
        delegate:self,
        cancelButtonTitle:"OK")
      alert.show()
  }

  public func scheduleNotification() {
    println("scheduleNotification()")
    //let date = NSDate()
    let date = NSDate(timeIntervalSinceNow: 5)
    // dateWithTimeIntervalSinceNow:60];

    let localNotification: UILocalNotification = UILocalNotification()
    localNotification.fireDate = date
    localNotification.alertBody = "Hello world"
    localNotification.alertAction = "Show me the item"
//    localNotification.timeZone = NSTimeZone.defaultTimeZone()
    // localNotification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber + 1

    UIApplication.sharedApplication().scheduleLocalNotification(localNotification)


  }

}
