//
//  EmotionalCheckinViewController.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/26/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import UIKit

class EmotionalCheckinViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Emotional Checkin"

        let blueLayer = ColorService().blueGradient()
        blueLayer.frame = self.view.bounds;

        let rgLayer = ColorService().thermometerGradient()
        rgLayer.frame = self.view.bounds;

        self.view.layer.insertSublayer(rgLayer, atIndex:0)
    }

    func onDone() {

    }
    
}

