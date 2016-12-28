//
//  ViewController.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 15/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController {
    
    var contactListTableView: View?
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        contactListTableView?.view = self.tableView

        contactListTableView?.viewDidLoaded!()
    }

}

