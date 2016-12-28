//
//  ContactListRepository.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 15/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import Foundation

struct ContactListRepository: Repository {
    var elements: [Contact]?
    var selectedElement: Contact?
}
