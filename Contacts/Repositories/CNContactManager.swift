//
//  CNContactManager.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 23/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import Contacts

@available(iOS 9.0, *)
class CNContactManager: ContactManager {
    
    var contactStore: CNContactStore?
    
    // MARK: Instance Initialization
    init() {
        self.createAddressBook()
    }
    
    func createAddressBook() -> Void {
        contactStore = CNContactStore()
    }
    
    func manageAutorizationStatus(completionHandler: RetrieveContactsCompletionBlock?) -> String? {
        var message:String? = nil
        let status = CNContactStore.authorizationStatus(for: CNEntityType.contacts)
        
        switch status {
        case .notDetermined: requestAccessToContacts(completionHandler: completionHandler)
        case .restricted, .denied: message = "You have to activate contact privacy permission"
        case .authorized: print("Success!")
            
        }
        
        return message
    }
    
    func requestAccessToContacts(completionHandler: RetrieveContactsCompletionBlock?) -> Void {
        contactStore?.requestAccess(for: CNEntityType.contacts, completionHandler: { (accessGranted, error) in
            if accessGranted {
                _ = self.retrieveContacts(completionHandler: completionHandler)
            } else {
                print("unable to request access")
            }
        })
    }
    
     func retrieveContacts(completionHandler: RetrieveContactsCompletionBlock?) -> [Contact] {
        var contacts = [Contact]()
        do {
            let contactsFetchRequest = CNContactFetchRequest(keysToFetch: [CNContactGivenNameKey as CNKeyDescriptor,
                CNContactFamilyNameKey as CNKeyDescriptor,
                CNContactImageDataKey as CNKeyDescriptor,
                CNContactImageDataAvailableKey as CNKeyDescriptor,
                CNContactPhoneNumbersKey as CNKeyDescriptor,
                CNContactEmailAddressesKey as CNKeyDescriptor])
            
            try contactStore?.enumerateContacts(with: contactsFetchRequest, usingBlock: { (cnContact, error) in
              let contact: Contact = self.convertCNContactToContact(cnContact: cnContact)
                contacts.append(contact)
                
            })
            
        } catch {
        }
        
        return contacts
    }
    
    func convertCNContactToContact(cnContact:CNContact) -> Contact {
        var name: String = ""
        var surname: String = ""
        var phoneList: [String] = [String]()
        var emailList: [String] = [String]()
        var image: Data? = nil

        if cnContact.isKeyAvailable(CNContactGivenNameKey) {
            name = cnContact.givenName
        } else {
            name = "NoName"
        }
        
        if cnContact.isKeyAvailable(CNContactFamilyNameKey) {
            surname = cnContact.familyName
        }
        
        if cnContact.isKeyAvailable(CNContactPhoneNumbersKey) {
            for phone in cnContact.phoneNumbers {
                let phoneNumber:String = phone.value.stringValue
                phoneList.append(phoneNumber)
            }
        }
        
        if cnContact.isKeyAvailable(CNContactEmailAddressesKey) {
            for possibleEmail in cnContact.emailAddresses {
                let email: String = possibleEmail.value as String
                emailList.append(email)
            }
        }
        
        if cnContact.isKeyAvailable(CNContactImageDataKey) {
            image = cnContact.imageData
        }
        
        let contact:Contact = Contact(name: name,
                                      surname: surname,
                                      lastSurname: nil,
                                      phoneList:phoneList,
                                      emailList:emailList,
                                      image:image)
        
        return contact
    }
}
