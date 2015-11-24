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
    
    @IBOutlet weak var onButtonPressed: UIButton!
    
    var popUpViewController : PopUpViewControllerSwift!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)


	SocketService().resetAll()
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Welcome"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Timeline", style: .Plain, target: self, action: "onDone")        
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
        let roadmapVc = TimelineViewController(nibName: "TimelineViewController", bundle: nil)
        self.navigationController?.pushViewController(roadmapVc, animated: true)
    }
    

    @IBAction func onLymphImagePressed(sender: AnyObject) {
        self.popUpViewController = PopUpViewControllerSwift(nibName: "PopUpViewController", bundle: nil)
        self.popUpViewController.title = "Lymph"
	let message = StringService().getString("PopUpLymphNodeText")
        self.popUpViewController.showInView(self.view, withImage: nil, withMessage: message, animated: true)
    }

    @IBAction func onBreastImagePressed(sender: AnyObject) {
        self.popUpViewController = PopUpViewControllerSwift(nibName: "PopUpViewController", bundle: nil)
        self.popUpViewController.title = "Breast"
	
	let message = StringService().getString("PopUpBoobText")
        self.popUpViewController.showInView(self.view, withImage: nil, withMessage: message, animated: true)
    }
        
}

