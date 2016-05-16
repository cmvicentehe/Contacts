//
//  ContactListRouting.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 15/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import UIKit

class ContactListRouting: Routing {
    
    var window: UIWindow
    
    init(window:UIWindow) {
        
        self.window = window
        window.makeKeyAndVisible()
    }
    
    func displayViewController(viewController:UIViewController) -> Void {
        
        window.rootViewController = viewController
    }
    
    
}