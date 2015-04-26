//
//  SocketService.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/25/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import Foundation

public class SocketService {


    public func resetAll() {

      let urls = [ "https://burning-heat-9358.firebaseio.com/checkpoints/survey",
      "https://burning-heat-9358.firebaseio.com/checkpoints/emotionalCheckin",
      "https://burning-heat-9358.firebaseio.com/checkpoints/appointmentConfirmed"]
      for url in urls {
        var myRootRef = Firebase(url: url)
        myRootRef.setValue(false)
      }
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
    }
    
    public func saveData() {
      var myRootRef = Firebase(url:"https://burning-heat-9358.firebaseio.com/helloworld")
        // Write data to Firebase
        myRootRef.setValue("Do you have data? You'll love Firebase.")
    }

    public func observeData() {
        var myRootRef = Firebase(url:"https://burning-heat-9358.firebaseio.com/onPush")
        myRootRef.observeEventType(.Value, withBlock: { snapshot in 
            println("\(snapshot.key) -> \(snapshot.value)")
            },
            withCancelBlock: { error in
              println(error.description)
            })
    }
}
