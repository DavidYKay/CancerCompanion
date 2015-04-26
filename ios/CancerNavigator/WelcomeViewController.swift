//
//  WelcomeViewController.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/25/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import UIKit
//import Math

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Welcome"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Timeline", style: .Plain, target: self, action: "onDone")
        
        let scrollPageController = TTScrollSlidingPagesController()
    }

    func onDone() {
        let roadmapVc = TimelineViewController(nibName: "TimelineViewController", bundle: nil)
        self.navigationController?.pushViewController(roadmapVc, animated: true)
    }
    
    @IBAction func onButtonPressed(sender: AnyObject) {
        let math = Math()
        let result = math.square(3)
        println("3 * 3 = " + result.description)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

