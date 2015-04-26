//
//  SocketService.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/25/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import Foundation

public class SocketService {


    init() {
    }
    
    public func saveData() {
      var myRootRef = Firebase(url:"https://burning-heat-9358.firebaseio.com/helloworld")
        // Write data to Firebase
        myRootRef.setValue("Do you have data? You'll love Firebase.")
    }

    public func observeData() {
        myRootRef = Firebase(url:"https://burning-heat-9358.firebaseio.com/onPush")
        myRootRef.observeEventType(.Value, withBlock: 
            snapshot in
            println("\(snapshot.key) -> \(snapshot.value)")
            },
            withCancelBlock: { error in
              println(error.description)
            })
    }
}
