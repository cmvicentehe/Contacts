//
//  ContactListPresenter.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 15/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import Foundation

struct ContactListPresenter: Presenter {
    
    // MARK: Presenter protocol properties
    var view: View
    var interactor: Interactor
    var routing: Routing
    
    // MARK: Instance Initialization
    init(view: View, interactor:Interactor, routing:Routing) {
        self.view = view
        self.interactor = interactor
        self.routing = routing
    }

    // MARK: Presenter protocol methods
    func viewDidLoaded() -> Void {
        self.interactor.retrieveContacts(completionHandler: { (contacts: [Contact]) -> Void in
           self.displayElements(contacts)
        })
    }
    
    func displayElements<Element>(_ elements: [Element]) -> Void {
        print(elements)
    }
    func displayElementInformation<Element>(_ element:Element) -> Void {}
    func reloadInformation<Element>(_ elements: [Element]) -> Void {}
}
