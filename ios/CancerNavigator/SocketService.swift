//
//  SocketService.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/25/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import Foundation
import SwiftEventBus

public class SocketService {


    public func resetAll() {

      let urls = [ "https://burning-heat-9358.firebaseio.com/checkpoints/survey",
      "https://burning-heat-9358.firebaseio.com/checkpoints/emotionalCheckin",
      "https://burning-heat-9358.firebaseio.com/checkpoints/appointmentConfirmed"]
      for url in urls {
        var myRootRef = Firebase(url: url)
        myRootRef.setValue(false)
      }
      
      SwiftEventBus.post("UpdateUI")
    }
    
    public func logAppointmentConfirmed() {
      setTrue("appointmentConfirmed")
    }
    
    public func logSurvey() {
      setTrue("survey")
    }

    public func logEmotionalCheckin() {
      setTrue("emotionalCheckin")
    }

    func setTrue(name:String ) {
      let url = "https://burning-heat-9358.firebaseio.com/checkpoints/\(name)"
      var myRootRef = Firebase(url: url)
      myRootRef.setValue(true)

      SwiftEventBus.post("UpdateUI")
    }

}
