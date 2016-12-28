//
//  Presenter.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 16/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import Foundation

protocol Presenter {
    
    var view: View { get }
    var interactor: Interactor { get }
    var routing: Routing { get }
    var isViewLoaded: Bool? { get set }

    func displayElements<Element>(_ elements: [Element]) -> Void
    func displayElementInformation<Element>(_ element:Element) -> Void
    func reloadInformation<Element>(_ elements: [Element]) -> Void

}
