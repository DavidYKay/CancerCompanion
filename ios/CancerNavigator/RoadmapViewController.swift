//
//  RoadmapViewController.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/25/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import UIKit

class RoadmapViewController: UIViewController {
       
  override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Roadmap"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "View Node Detail", style: .Plain, target: self, action: "onDone")
    }

    func onDone() {
        let timelineVc = NodeDetailViewController(nibName: "NodeDetailViewController", bundle: nil)
        self.navigationController?.pushViewController(timelineVc, animated: true)
    }
    
    @IBAction func onButtonPressed(sender: AnyObject) {
        let timelineVc = TimelineViewController(nibName: "TimelineViewController", bundle: nil)
        self.navigationController?.pushViewController(timelineVc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

