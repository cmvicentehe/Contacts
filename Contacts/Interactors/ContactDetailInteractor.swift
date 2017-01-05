//
//  ContactDetailInteractor.swift
//  Contacts
//
//  Created by Carlos Manuel Vicente Herrero on 4/1/17.
//  Copyright © 2017 Carlos M. Vicente Herrero. All rights reserved.
//

import Foundation

struct ContactDetailInteractor: Interactor {
    var presenter: Presenter?
    var repository: Repository
    var selectedContact: Contact? {
        return self.repository.selectedContact
    }
    
    init(repository:Repository) {
        self.repository = repository
    }
}
