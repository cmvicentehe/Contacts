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
        
        let status = CNContactStore.authorizationStatusForEntityType(CNEntityType.Contacts)
        
        switch status {
            
        case .NotDetermined: requestAccessToContacts(completionHandler)
        case .Restricted, .Denied: message = "You have to activate contact privacy permission"
        case .Authorized: print("Success!")
            
        }
        
        return message
    }
    
    func requestAccessToContacts(completionHandler: RetrieveContactsCompletionBlock?) -> Void {
        
        contactStore?.requestAccessForEntityType(CNEntityType.Contacts, completionHandler: { (accessGranted, error) in
            
            if accessGranted {

                self.retrieveContacts(completionHandler)
                
            } else {
                
                print("unable to request access")
            }
        })
    }
    
     func retrieveContacts(completionHandler: RetrieveContactsCompletionBlock?) -> [Contact] {
        
        var contacts = [Contact]()
        do {
            
            let contactsFetchRequest = CNContactFetchRequest(keysToFetch: [CNContactGivenNameKey,
                CNContactFamilyNameKey,
                CNContactImageDataKey,
                CNContactImageDataAvailableKey,
                CNContactPhoneNumbersKey,
                CNContactEmailAddressesKey])
            
            try contactStore?.enumerateContactsWithFetchRequest(contactsFetchRequest, usingBlock: { (cnContact, error) in
                
                if let contact: Contact = self.convertCNContactToContact(cnContact) {
                    contacts.append(contact)
                }
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
        var image: NSData? = nil
        
        
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
                
                if let phoneNumber = phone.value as? CNPhoneNumber {
                    
                    phoneList.append(phoneNumber.stringValue)
                }
            }
        }
        
        
        if cnContact.isKeyAvailable(CNContactEmailAddressesKey) {
            
            for possibleEmail in cnContact.emailAddresses {
                
                if let email = possibleEmail.value as? String {
                
                    emailList.append(email)
                }
            }
        }
        
        if cnContact.isKeyAvailable(CNContactImageDataKey) {
            
            image = cnContact.imageData
        }
        
        let contact:Contact = Contact(name: name,
                                      surname: surname,
                                      phoneList:phoneList,
                                      emailList:emailList,
                                      image:image)
        
        return contact
    }
}