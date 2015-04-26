//
//  TimelineViewController.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/25/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Timeline"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Chat", style: .Plain, target: self, action: "onDone")
        
    }

    func onDone() {
        let roadmapVc = ChatViewController(nibName: "ChatViewController", bundle: nil)
        self.navigationController?.pushViewController(roadmapVc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

