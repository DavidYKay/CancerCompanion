//
//  EmotionalCheckinViewController.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/26/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import UIKit

class EmotionalCheckinViewController: UIViewController, ThermometerListener {

    @IBOutlet weak var currentValueLabel: UILabel!
    @IBOutlet weak var thermometerView: ThermometerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Emotional Checkin"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: "onDone")        
        
        self.thermometerView.listener = self
	
    }
    
    func onNewThermometerValue(thermometerValue: Int) {
        self.currentValueLabel.text = "Current value: \(thermometerValue)" 
	  SocketService().logEmotionalCheckin(thermometerValue)
    }

    func onDone() {
        let vc = FinalViewController(nibName: "FinalViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

