//
//  ContactDetailView.swift
//  Contacts
//
//  Created by Carlos Manuel Vicente Herrero on 2/1/17.
//  Copyright © 2017 Carlos M. Vicente Herrero. All rights reserved.
//

import Foundation

protocol ContactDetailView: View {
    func displayContactInformation(_ contact: Contact) -> Void
}
