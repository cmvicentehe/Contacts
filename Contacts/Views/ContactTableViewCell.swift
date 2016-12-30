//
//  ContactTableViewCell.swift
//  Contacts
//
//  Created by Carlos Manuel Vicente Herrero on 28/12/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: Public methods
    func bindContact(_ contact: Contact) -> Void {
        self.nameLabel.text = "\(contact.name) \(contact.surname)"
        if let image = contact.image {
            self.contactImage.image = UIImage.init(data: image)
        } else {
            self.contactImage.image = #imageLiteral(resourceName: "noPhoto")
        }
    }
}
