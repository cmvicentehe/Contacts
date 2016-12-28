//
//  AppDelegate.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 15/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var contactListDependencyInjector: ContactListDependencyInjetor?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        contactListDependencyInjector = ContactListDependencyInjetor()
        let window:UIWindow = UIWindow(frame:UIScreen.main.bounds)
        
        guard let contactListRouting:Routing = contactListDependencyInjector?.createContactListRouting(window) else { return false }
        
        let presenter:Presenter = (contactListDependencyInjector?.createContactListPresenter(contactListRouting))!
        
        let view:View = presenter.view
        guard let contactListViewController:UIViewController = contactListDependencyInjector?.createContactListViewController(view) else { return false }
        
        contactListRouting.displayViewController(contactListViewController)
        
        return true
    }
}

