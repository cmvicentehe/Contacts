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
    var isViewLoaded:Bool?
    
    // MARK: Instance Initialization
    init(view: View, interactor:Interactor, routing:Routing) {
        
        self.view = view
        self.interactor = interactor
        self.routing = routing
    }

    // MARK: Presenter protocol methods
    func displayElements<Element>(_ elements: [Element]) -> Void {}
    func displayElementInformation<Element>(_ element:Element) -> Void {}
    func reloadInformation<Element>(_ elements: [Element]) -> Void {}
    
}
