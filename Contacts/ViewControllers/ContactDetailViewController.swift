//
//  ContactDetailViewController.swift
//  Contacts
//
//  Created by Carlos Manuel Vicente Herrero on 2/1/17.
//  Copyright © 2017 Carlos M. Vicente Herrero. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController, ContactDetailView {
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var nameLeftLabel: UILabel!
    @IBOutlet weak var nameRightLabel: UILabel!
    @IBOutlet weak var firstSurnameLeftLabel: UILabel!
    @IBOutlet weak var firstSurnameRightLabel: UILabel!
    @IBOutlet weak var lastSurnameLeftLabel: UILabel!
    @IBOutlet weak var lastSurnameRightLabel: UILabel!
    @IBOutlet weak var phoneListLeftLabel: UILabel!
    @IBOutlet weak var phoneListRightLabel: UILabel!
    @IBOutlet weak var mailListLeftLabel: UILabel!
    @IBOutlet weak var mailListRightLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var presenter: Presenter? { get {
        return self.contactDetailPresenter
        }
    }
    var viewElement: UIView?
    var contactDetailPresenter: ContactDetailPresenter?
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contact Detail"
        self.contactDetailPresenter?.viewDidLoaded()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.contactDetailPresenter?.viewWillDissapeared()
    }

    // MARK: ContactDetailView protocol methods
    func displayContactInformation(_ contact: Contact) -> Void {
        if let image = contact.image {
            self.contactImage.image = UIImage(data: image)
            self.contactImage.layer.cornerRadius = self.contactImage.frame.size.width / 2
        } else {
            self.contactImage.image = #imageLiteral(resourceName: "contactNoPhoto")
        }
        
        self.nameRightLabel.text = contact.name
        self.firstSurnameRightLabel.text = contact.firstSurname ?? "--"
        self.lastSurnameRightLabel.text = contact.lastSurname ?? "--"
        self.phoneListRightLabel.text = contact.phoneList?.description
        self.mailListRightLabel.text = contact.emailList?.description
    }
}
