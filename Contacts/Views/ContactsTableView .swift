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
            self.tableView.separatorStyle = .none
        }
    }
    
    // MARK: View protocol methods
    
    func viewDidLoaded() {
        self.presenter?.viewDidLoaded()
    }
    
    func displayContacts(_ contacts: [Contact]) {
        DispatchQueue.main.async {
            self.contactListDataInformation = ContactListData(contactList: contacts)
            self.tableView.reloadData()
        }
    }
    
    // MARK: UITableViewDataSource methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contactListDataInformation?.contactList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier:String = Constants.contactTableViewCell
        var cell:ContactTableViewCell? = (tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ContactTableViewCell)
        
        if  cell == nil {
            cell = ContactTableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
       
        if let contact = self.contactListDataInformation?.contactList[indexPath.row] {
            cell?.bindContact(contact)
        }
        
        return cell!
    }
    
     // MARK: UITableViewDelegate methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
