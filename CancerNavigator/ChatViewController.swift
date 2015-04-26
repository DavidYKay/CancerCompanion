//
//  ChatViewController.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/25/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import UIKit


public class ChatViewController: UIViewController {
    
    public override  func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Chat"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Checklist", style: .Plain, target: self, action: "onDone")
        
    }

    func onDone() {
        let roadmapVc = ChecklistViewController(nibName: "ChecklistViewController", bundle: nil)
        self.navigationController?.pushViewController(roadmapVc, animated: true)
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

