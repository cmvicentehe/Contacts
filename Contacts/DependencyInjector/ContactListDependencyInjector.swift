//
//  ContactListDependencyInjector.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 15/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import UIKit

class ContactListDependencyInjetor: NSObject {
    
    // MARK: Routing
    func createContactListRouting(_ window: UIWindow) -> ContactListRouting {
        let contactListRouting: ContactListRouting = ContactListRouting(window: window)
        return contactListRouting
    }
    
    // MARK: ContactListData information
    func createContactListData() -> ContactListData {
        let contactList:Array<Contact> = Array<Contact>()
        let contactListData:ContactListData = ContactListData(contactList: contactList)
        return contactListData
    }
    
    // MARK: Contact list presenter
    func createContactListPresenter(_ routing:Routing) -> ContactListPresenter {
        let contactListTableView:ContactsTableView = createContactsTableView()
        var contactListInteractor:ContactListInteractor = createContactListInteractor()
        let contactListPresenter:ContactListPresenter = ContactListPresenter(view: contactListTableView, interactor: contactListInteractor, routing: routing)
        
        contactListTableView.presenter = contactListPresenter
        contactListInteractor.presenter = contactListPresenter
        
        return contactListPresenter
    }
    
    // MARK: Contact list interactor
    func createContactListInteractor() -> ContactListInteractor {
        let repository:ContactListRepository = createContactListRepository()
        let contactListInteractor:ContactListInteractor = ContactListInteractor(repository: repository)
        return contactListInteractor
    }
    
    // MARK: Contact list repository
    func createContactListRepository() -> ContactListRepository {
        let repository:ContactListRepository = ContactListRepository()
        let contactManager = self.createContactManager()
        repository.contactManager = contactManager
        
        return repository
    }
    
    // MARK: ContactManager
    
    func createContactManager() -> ContactManager {
        let contactManager: ContactManager
        if #available(iOS 9.0, *) {
            contactManager = CNContactManager()
        } else {
            contactManager = AddressBookContactManager()
        }
        
        return contactManager
    }
    
    // MARK: Contact list views
    func createContactsTableView() -> ContactsTableView {
        let contactsTableView:ContactsTableView = ContactsTableView()
        return contactsTableView
    }
    
    func createContactListViewController(_ view:View) -> ContactListViewController? {
        let contactsStoryBoard: UIStoryboard = UIStoryboard(name: Constants.contactsStoryboard, bundle: nil)
        guard let contactListViewController: ContactListViewController = contactsStoryBoard.instantiateViewController(withIdentifier: Constants.contactListViewController) as? ContactListViewController else { return nil }
        
        contactListViewController.contactListTableView = view
        return contactListViewController
    }
    
}
