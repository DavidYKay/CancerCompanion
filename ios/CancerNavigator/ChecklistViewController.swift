//
//  ChecklistViewController.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/25/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import UIKit

public class ChecklistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    @IBOutlet
    var tableView: UITableView!
    var items: [String] = ["1. What is my diagnosis & stage?",
                           "2. Has my cancer spread anywhere?",
                           "3. Is it possible to cure my cancer?",
                           "4. What might happen if I decide not to have treatment?",
                           "5. Do I need to decide right away, or can I wait until after holiday or vacation?"]
    
    let cellIdentifier = "StandardCellId"
    var lastSelectedIndexPath: NSIndexPath? = nil
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Checklist"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: "onDone")
        self.tableView.registerClass(UITableViewCell.self,forCellReuseIdentifier: cellIdentifier)
        self.tableView.allowsMultipleSelection = true

	SocketService().logSurvey()
        
//        self.tableView.rowHeight = UITableViewAutomaticDimension;
//        self.tableView.estimatedRowHeight = 44.0; // set to whatever your "average" cell height is
    }

    func onDone() {
        //let roadmapVc = ChecklistViewController(nibName: "SurveyViewController", bundle: nil)
        //self.navigationController?.pushViewController(roadmapVc, animated: true)
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
//        let myData = myArray[indexPath.row]
//        cellIdentifier = myData ? "a" : "b"
        //let cellIdentifier = "StandardCellId"
        
        
        var cell:UITableViewCell? = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        cell!.textLabel?.text = self.items[indexPath.row]
        //cell!.accessoryType = (self.lastSelectedIndexPath?.row == indexPath.row) ? .Checkmark : .None
        
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        }

        
        if let selectedPaths = tableView.indexPathsForSelectedRows {
            let selected = selectedPaths.filter(){ $0 == indexPath }
            if selected.count > 0 {
                cell!.accessoryType = (self.lastSelectedIndexPath?.row == indexPath.row) ? .Checkmark :.None
            }
        }
        
        cell!.backgroundColor = UIColor.clearColor()
        cell!.textLabel?.textColor = UIColor.darkTextColor()
        cell!.selectionStyle = UITableViewCellSelectionStyle.Blue
        return cell!
    }
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        //tableView.deselectRowAtIndexPath(indexPath, animated: true)

        
        if indexPath.row != self.lastSelectedIndexPath?.row {
            if let lastSelectedIndexPath = lastSelectedIndexPath {
                let oldCell = tableView.cellForRowAtIndexPath(lastSelectedIndexPath)
                oldCell?.accessoryType = .None
            }

            let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
            cell.textLabel?.text = self.items[indexPath.row]

        
            if let selectedPaths = tableView.indexPathsForSelectedRows {
                let selected = selectedPaths.filter(){ $0 == indexPath }
                if selected.count > 0 {
                    //let newCell = tableView.cellForRowAtIndexPath(indexPath)
                    if(self.lastSelectedIndexPath?.row == indexPath.row){
                        cell.accessoryType = .Checkmark
                    }
                    else{
                        cell.accessoryType = .None
                    }
                    //newCell!.accessoryType = (self.lastSelectedIndexPath?.row == indexPath.row) ? .Checkmark :.None
//                     cell.accessoryType = (self.lastSelectedIndexPath?.row == indexPath.row) ? .Checkmark :.None
                }
            }

            lastSelectedIndexPath = indexPath
        }
        
        //tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
        //tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
//
    public func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
          let newCell = tableView.cellForRowAtIndexPath(indexPath)
          newCell?.accessoryType = .None

    }


    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

