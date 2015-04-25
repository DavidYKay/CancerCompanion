//
//  WelcomeViewController.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/25/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Welcome"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Continue", style: .Plain, target: self, action: "onDone")
    }

    func onDone() {
        let roadmapVc = RoadmapViewController(nibName: "RoadmapViewController", bundle: nil)
        self.navigationController?.pushViewController(roadmapVc, animated: true)
    }
    
    @IBAction func onButtonPressed(sender: AnyObject) {
        println("hello world!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

