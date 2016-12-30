//
//  Repository.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 16/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import Foundation

protocol Repository {
    var contacts:[Contact]? { get }
    var selectedContact: Contact? { get }
    
    func retrieveContacts(completionHandler: RetrieveContactsCompletionBlock?) -> Void
    func notifyMessage(message:String) -> Void
}
