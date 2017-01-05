//
//  Contact.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 15/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import Foundation

struct Contact {
    
    let name: String
    let surname: String
    var firstSurname: String? { get {
        let surnameComponents = surname.components(separatedBy: " ")
        let firstSurnameResult = surnameComponents[0]
        
        return firstSurnameResult
        }
    }
    var lastSurname:String? { get {
        var lastSurnameResult = ""
        let surnameComponents = surname.components(separatedBy: " ")
        if surnameComponents.count == 1 {
            lastSurnameResult = "--"
        } else if surnameComponents.count == 2 {
            lastSurnameResult = surnameComponents[1]
        } else if surnameComponents.count > 2 {
            for (index, component) in surnameComponents.enumerated() {
                if index > 0 {
                    lastSurnameResult = lastSurnameResult.appending("\(component)")
                    if index < surnameComponents.count - 1 {
                      lastSurnameResult = lastSurnameResult.appending(" ")
                    }
                }
                
            }
        }
        
        return lastSurnameResult
        
    }}
    let phoneList: [String]?
    let emailList: [String]?
    let image: Data?
}
