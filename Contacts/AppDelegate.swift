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
        
        guard let contactListRouting:ContactListRouting = contactListDependencyInjector?.createContactListRouting(window) else { return false }
        
        let presenter:Presenter = (contactListDependencyInjector?.createContactListPresenter(contactListRouting))!
        
        let view:View = presenter.view
        guard let contactListViewController:UIViewController = contactListDependencyInjector?.createContactListViewController(view) else { return false }
        let navigationController = UINavigationController(rootViewController: contactListViewController)
        navigationController.navigationBar.backgroundColor = UIColor.white
        navigationController.navigationBar.isOpaque = true
        navigationController.navigationBar.isTranslucent = false
        contactListRouting.displayInitialViewController(navigationController)
        
        return true
    }
}

