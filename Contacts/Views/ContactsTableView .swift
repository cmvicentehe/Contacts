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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier:String = "cell"
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if  cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        cell?.textLabel?.text = "cell in position \(indexPath.row)"
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
