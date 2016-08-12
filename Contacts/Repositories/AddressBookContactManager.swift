//
//  AddressBookContactManager.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 23/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import AddressBook
import Foundation
import UIKit

class AddressBookContactManager:ContactManager {
    
    var addressBook:ABAddressBook?
    
    // MARK: Instance Initialization
    init() {
        
        self.createAddressBook()
    }
    
    func createAddressBook() -> Void {
        
        var errorRef: Unmanaged<CFError>?
        addressBook = ABAddressBookCreateWithOptions(nil, &errorRef).takeRetainedValue() as ABAddressBook
    }
    
    // MARK: ABAddressPermision
    func manageAutorizationStatus(completionHandler: RetrieveContactsCompletionBlock?) -> String? {
        
        var message:String? = nil
        if let status: ABAuthorizationStatus = ABAddressBookGetAuthorizationStatus() {
            
            switch status {
                
            case .NotDetermined: requestAccessToContacts(completionHandler)
            case .Restricted, .Denied: message = "You have to activate contact privacy permission"
            case .Authorized: print("Success!")
                
            }
        }
        
        return message
    }
    
    func requestAccessToContacts(completionHandler: RetrieveContactsCompletionBlock?) -> Void {
        
        ABAddressBookRequestAccessWithCompletion(addressBook, {[weak self] (granted: Bool, error: CFError!) in
            
            if granted {
                
                self?.retrieveContacts(completionHandler)
                
            } else {
                
                NSLog("unable to request access")
            }
        })
        
    }
    
    // MARK: Contacts management
    func retrieveContacts(completionHandler: RetrieveContactsCompletionBlock?) -> [Contact] {
        
        var contacts:[Contact] = [Contact]()
        let records:[ABRecordRef] = ABAddressBookCopyArrayOfAllPeople(addressBook).takeRetainedValue() as Array<ABRecordRef>
        
        for record:ABRecordRef in records {
            
            let contact:Contact = convertRecordToContact(record)
            contacts.append(contact)
        }
        
        return contacts
    }
    
    func convertRecordToContact(record:ABRecordRef) -> Contact {
        
        var firstName:String? = ABRecordCopyValue(record,
                                          kABPersonFirstNameProperty).takeRetainedValue() as? String
        var surname:String? = ABRecordCopyValue(record,
                                                 kABPersonLastNameProperty).takeRetainedValue() as? String
        let emailRef: ABMultiValueRef = ABRecordCopyValue(record,
                                                          kABPersonEmailProperty).takeRetainedValue()
        let phoneRef: ABMultiValueRef = ABRecordCopyValue(record,
                                                          kABPersonPhoneProperty).takeRetainedValue()
        let imgData:NSData = ABPersonCopyImageDataWithFormat(record, kABPersonImageFormatOriginalSize).takeRetainedValue() as NSData
        
        if firstName == nil {
            
            firstName = "NoName"
        }
        
        if surname == nil {
            
            surname = ""
        }
        
        let phoneList:[String]? = ABMultiValueCopyArrayOfAllValues(phoneRef).takeRetainedValue() as? [String]
        let emailList:[String]? = ABMultiValueCopyArrayOfAllValues(emailRef).takeRetainedValue() as? [String]
        
        let contact:Contact = Contact(name: firstName!,
                                      surname: surname!,
                                      phoneList:phoneList,
                                      emailList:emailList,
                                      image:imgData)
        
        return contact
    }
    
}