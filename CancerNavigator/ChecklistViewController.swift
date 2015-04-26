//
//  ChecklistViewController.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/25/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import Foundation

public class ChecklistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet
    var tableView: UITableView!
    var items: [String] = ["1. What is my diagnosis & stage?",
                           "2. Has my cancer spread anywhere?",
                           "3. Is it possible to cure my cancer?",
                           "4. What might happen if I decide not to have treatment?",
                           "5. Do I need to decide right away, or can I wait until after holiday or vacation?"]
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Checklist"
//        self.tableView.registerClass(UITableViewCell.self,forCellReuseIdentifier: "cell")
    }

    func onDone() {

    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
//        let myData = myArray[indexPath.row]
//        cellIdentifier = myData ? "a" : "b"
        let cellIdentifier = "StandardCellId"
        
        var cell:UITableViewCell? = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        } else{
            // we already have one from reuse
        }
        
        cell!.textLabel?.text = self.items[indexPath.row]
        
        return cell!
    }
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
    }


    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

