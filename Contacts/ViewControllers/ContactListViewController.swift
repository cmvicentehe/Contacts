//
//  ViewController.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 15/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController {
    
    var contactListTableView: View
    
    // MARK: Instance Initialization
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(view: View) {
    
        self.contactListTableView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        let tableView:UITableView = UITableView(frame: CGRectZero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let ownView:UIView = view
        ownView.translatesAutoresizingMaskIntoConstraints = false
        ownView.addSubview(tableView)
        
        contactListTableView.view = tableView
        
        let views:Dictionary<String, UIView> = ["ownView" : ownView,
                                                "tableView" :tableView]
        
        ownView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[tableView]|",
            options: NSLayoutFormatOptions.DirectionLeadingToTrailing,
            metrics: nil,
            views: views))
        
        ownView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[tableView]|",
            options: NSLayoutFormatOptions.DirectionLeadingToTrailing,
            metrics: nil,
            views: views))
        
        contactListTableView.viewDidLoaded!()
    }

}

