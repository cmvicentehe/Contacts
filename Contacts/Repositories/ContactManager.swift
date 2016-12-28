//
//  ContactManager.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 23/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import Foundation

protocol ContactManager {
    func createAddressBook() -> Void
    func manageAutorizationStatus(completionHandler: RetrieveContactsCompletionBlock?) -> String?
    func requestAccessToContacts(completionHandler: RetrieveContactsCompletionBlock?) -> Void
    func retrieveContacts(completionHandler: RetrieveContactsCompletionBlock?) -> [Contact]
}
