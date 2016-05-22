//
//  ContactsTableView .swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 21/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import UIKit

class ContactsTableView:NSObject, View, UITableViewDelegate, UITableViewDataSource {
    
    weak var tableView:UITableView!
    var contactListDataInformation:ContactListData?
    var presenter: Presenter?
    var view:UIView { get {
        
        return self.tableView
        }
        
        set {
            
            self.tableView = newValue as? UITableView
            self.tableView.dataSource = self
            self.tableView.delegate = self
        }
        
    }
    
    // MARK: View protocol methods
    
    func viewDidLoaded() {
        
        presenter?.isViewLoaded = true
    }
    
    // MARK: UITableViewDataSource methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier:String = "cell"
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        
        if  cell == nil {
            
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
            
        }
        
        cell?.textLabel?.text = "cell in position \(indexPath.row)"
        
        return cell!
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}