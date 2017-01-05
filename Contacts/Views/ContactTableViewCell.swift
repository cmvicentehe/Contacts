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
    @IBOutlet weak var mailAvailableImageView: UIImageView!
    @IBOutlet weak var phoneAvailableImageView: UIImageView!
    
    // MARK: Public methods
    func bindContact(_ contact: Contact) -> Void {
        self.nameLabel.text = "\(contact.name) \(contact.surname)"
        if let image = contact.image {
            self.contactImage.image = UIImage.init(data: image)
            self.contactImage.layer.cornerRadius = self.contactImage.frame.size.width / 2
        } else {
            self.contactImage.image = #imageLiteral(resourceName: "noPhoto")
        }
        let phoneList = contact.phoneList
        
        if phoneList != nil && (phoneList?.count)! > 0 {
            self.phoneAvailableImageView.isHidden = false
        } else {
            self.phoneAvailableImageView.isHidden = true
        }
        
        let emailList = contact.emailList
        
        if emailList != nil && (emailList?.count)! > 0 {
            self.mailAvailableImageView.isHidden = false
        } else {
            self.mailAvailableImageView.isHidden = true
        }
    }
}
