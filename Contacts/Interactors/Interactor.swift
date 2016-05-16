//
//  Interactor.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 16/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import Foundation

protocol Interactor {
    
    var presenter: Presenter { get }
    var repository: Repository { get }
    
}