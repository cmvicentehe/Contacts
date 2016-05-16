//
//  Contact.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 15/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import Foundation
import UIKit

struct Contact {
    
    var name: String
    var surname: String
    var lastSurname:String?
    var phone: String?
    var email: String?
    var image: UIImage?
    
    init(name:String,
         surname:String,
         lastSurname:String?,
         phone:String?,
         email:String?,
         image:UIImage?) {
    
        self.name = name
        self.surname = surname
        self.lastSurname = lastSurname
        self.phone = phone
        self.email = email
        self.image = image
    }
}