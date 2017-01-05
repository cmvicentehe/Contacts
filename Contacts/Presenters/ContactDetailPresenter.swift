//
//  ContactDetailPresenter.swift
//  Contacts
//
//  Created by Carlos Manuel Vicente Herrero on 2/1/17.
//  Copyright © 2017 Carlos M. Vicente Herrero. All rights reserved.
//

import Foundation

struct ContactDetailPresenter: Presenter {
    var view: View { get {
        return self.contactDetailView
        }
    }
    var contactDetailView: ContactDetailView
    var routing: Routing
    var contactDetailInteractor: ContactDetailInteractor
    
    // MARK: Presenter protocol methods
    func viewDidLoaded() -> Void {
        if let contact = self.contactDetailInteractor.selectedContact {
            self.displayContactInformation(contact)
        }
    }
    
    func viewWillDissapeared() -> Void {
        self.contactDetailInteractor.repository.selectContact(nil)
    }
    
     // MARK: Private methods
    private func displayContactInformation(_ contact:Contact) -> Void {
        self.contactDetailView.displayContactInformation(contact)
    }
}
