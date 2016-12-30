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
    var view: View
    var interactor: Interactor
    var routing: Routing
    
    // MARK: Instance Initialization
    init(view: View, interactor:Interactor, routing:Routing) {
        self.view = view
        self.interactor = interactor
        self.routing = routing
    }

    // MARK: Presenter protocol methods
    func viewDidLoaded() -> Void {
        self.interactor.retrieveContacts(completionHandler: { (contacts: [Contact]) -> Void in
           self.displayContacts(contacts)
        })
    }
    
    func displayContacts(_ contacts: [Contact]) -> Void {
        self.view.displayContacts(contacts)
    }
    func displayContactInformation(_ contact:Contact) -> Void {}
}
