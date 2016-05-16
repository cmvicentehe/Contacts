//
//  ContactListDependencyInjector.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 15/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import UIKit

class ContactListDependencyInjetor: NSObject {
    
    func createContactListViewController() -> ContactListViewController {
     
         let contactListViewController: ContactListViewController = ContactListViewController(nibName: nil, bundle: NSBundle.mainBundle())
        
        return contactListViewController
    }
    
    func createContactListRouting(window: UIWindow) -> ContactListRouting {
        
        let contactListRouting: ContactListRouting = ContactListRouting(window: window)
        
        return contactListRouting
    }
    
}