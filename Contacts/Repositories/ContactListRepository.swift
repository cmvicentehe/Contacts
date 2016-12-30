//
//  ContactListRepository.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 15/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import Foundation

typealias RetrieveContactsCompletionBlock = (_ contacts: [Contact]) -> Void

class ContactListRepository: Repository {
    var contacts: [Contact]?
    var selectedContact: Contact?
    var contactManager:ContactManager?
    
    func retrieveContacts(completionHandler: RetrieveContactsCompletionBlock?) -> Void {
        self.contactManager?.requestAccessToContacts(completionHandler: completionHandler)
    }
    
    func notifyMessage(message:String) -> Void {
    }
}
