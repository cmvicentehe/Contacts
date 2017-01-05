//
//  ContactListInteractor.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 15/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import Foundation

struct ContactListInteractor: Interactor {
    var presenter: Presenter?
    var repository: Repository
    
    init(repository:Repository) {
        self.repository = repository
    }
    
    func retrieveContacts(completionHandler: RetrieveContactsCompletionBlock?) -> Void {
        self.repository.retrieveContacts(completionHandler: completionHandler)
    }
    
    func selectContact(_ contact: Contact) -> Void {
        self.repository.selectContact(contact)
    }
}
