//
//  Contact.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 15/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import Foundation

struct Contact {
    
    var name: String
    var surname: String
    var phoneList: [String]?
    var emailList: [String]?
    var image: NSData?
    
    init(name:String,
         surname:String,
         phoneList:[String]?,
         emailList:[String]?,
         image:NSData?) {
        
        self.name = name
        self.surname = surname
        self.phoneList = phoneList
        self.emailList = emailList
        self.image = image
    }
}