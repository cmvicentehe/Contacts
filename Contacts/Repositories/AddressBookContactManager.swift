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
        let status: ABAuthorizationStatus = ABAddressBookGetAuthorizationStatus()
        
        switch status {
            case .notDetermined: requestAccessToContacts(completionHandler: completionHandler)
            case .restricted, .denied: message = "You have to activate contact privacy permission"
            case .authorized: print("Success!")
        }
        
        return message
    }
    
    func requestAccessToContacts(completionHandler: RetrieveContactsCompletionBlock?) -> Void {
        ABAddressBookRequestAccessWithCompletion(addressBook, { (granted, error) in
            if granted {
               _ =  self.retrieveContacts(completionHandler: completionHandler)
            } else {

                print("unable to request access")
            }
        })

    }
    
    // MARK: Contacts management
    func retrieveContacts(completionHandler: RetrieveContactsCompletionBlock?) -> [Contact] {
        var contacts:[Contact] = [Contact]()
        let records:[ABRecord] = ABAddressBookCopyArrayOfAllPeople(addressBook).takeRetainedValue() as Array<ABRecord>
        
        for record:ABRecord in records {
            let contact:Contact = convertRecordToContact(record: record)
            contacts.append(contact)
        }
        return contacts
    }
    
    func convertRecordToContact(record:ABRecord) -> Contact {
        var firstName:String? = ABRecordCopyValue(record,
                                          kABPersonFirstNameProperty).takeRetainedValue() as? String
        var surname:String? = ABRecordCopyValue(record,
                                                 kABPersonLastNameProperty).takeRetainedValue() as? String
        let emailRef: ABMultiValue = ABRecordCopyValue(record,
                                                          kABPersonEmailProperty).takeRetainedValue()
        let phoneRef: ABMultiValue = ABRecordCopyValue(record,
                                                          kABPersonPhoneProperty).takeRetainedValue()
        let imgData:Data = ABPersonCopyImageDataWithFormat(record, kABPersonImageFormatOriginalSize).takeRetainedValue() as Data
        
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
                                      lastSurname: nil,
                                      phoneList:phoneList,
                                      emailList:emailList,
                                      image:imgData)
        
        return contact
    }
}
