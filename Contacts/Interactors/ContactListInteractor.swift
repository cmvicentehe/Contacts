//
//  ContactListInteractor.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 15/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import Foundation

class ContactListInteractor: Interactor {

    var presenter: Presenter
    var repository: Repository
    
    init(presenter:Presenter, repository:Repository) {
    
        self.presenter = presenter
        self.repository = repository
    }
    
}