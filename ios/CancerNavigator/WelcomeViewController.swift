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
    
//    private PopUpViewControllerSwift popUpViewController;
    @IBOutlet weak var onButtonPressed: UIButton!
    
    var popUpViewController : PopUpViewControllerSwift!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setRoundedBorder(5, withBorderWidth: 1, withColor: UIColor(red: 0.0, green: 122.0/2550, blue: 1.0, alpha: 1.0), forButton: onButtonPressed)
        self.navigationItem.title = "Welcome"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Continue", style: .Plain, target: self, action: "onDone")
        
        let scrollPageController = TTScrollSlidingPagesController()
        
        
    }
    
    func setRoundedBorder(radius : CGFloat, withBorderWidth borderWidth: CGFloat, withColor color : UIColor, forButton button : UIButton)
    {
        let l : CALayer = button.layer
        l.masksToBounds = true
        l.cornerRadius = radius
        l.borderWidth = borderWidth
        l.borderColor = color.CGColor
    }

    func onDone() {
        let roadmapVc = RoadmapViewController(nibName: "RoadmapViewController", bundle: nil)
        self.navigationController?.pushViewController(roadmapVc, animated: true)
    }
    
    @IBAction func onButtonPressed(sender: AnyObject) {
        
//    if (UIDevice.currentDevice().userInterfaceIdiom == .Pad)
//        {
        self.popUpViewController = PopUpViewControllerSwift(nibName: "PopUpViewController", bundle: nil)
        self.popUpViewController.title = "This is a popup view"
        self.popUpViewController.showInView(self.view, withImage: UIImage(named: "typpzDemo"), withMessage: "You just triggered a great popup window", animated: true)
        //}
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

