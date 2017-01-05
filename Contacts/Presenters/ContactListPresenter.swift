
//
//  ContactListPresenter.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 15/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import Foundation

struct ContactListPresenter: Presenter {
    
    // MARK: Presenter protocol properties
    var view: View  { get {
        return self.contactListView
        }
    }
    var routing: Routing { get {
        return self.contactListRouting
        }
    }
    var contactListView: ContactListView
    var contactListInteractor: ContactListInteractor
    var contactListRouting: ContactListRouting
    
    // MARK: Presenter protocol methods
    func viewDidLoaded() -> Void {
        self.contactListInteractor.retrieveContacts(completionHandler: { (contacts: [Contact]) -> Void in
            self.displayContacts(contacts)
        })
    }
    
    func displayContacts(_ contacts: [Contact]) -> Void {
        self.contactListView.displayContacts(contacts)
    }
    
    func userDidSelectContact(_ contact: Contact) {
        self.contactListInteractor.selectContact(contact)
        let repository = self.contactListInteractor.repository
        self.contactListRouting.displayDetailViewController(with: repository)
    }
}
