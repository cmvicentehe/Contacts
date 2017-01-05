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
    var navigationController: UINavigationController?
    
    init(window:UIWindow) {
        self.window = window
        window.makeKeyAndVisible()
    }
    
    func displayInitialViewController(_ viewController: UIViewController) -> Void {
        if viewController is UINavigationController {
            self.navigationController = viewController as? UINavigationController
        } else {
            self.navigationController = UINavigationController(rootViewController: viewController)
        }
        self.window.rootViewController = self.navigationController
    }
    
    func pushViewController(_ viewController: UIViewController) -> Void {
        if let navigationController = self.navigationController {
            navigationController.pushViewController(viewController, animated: true)
        } else {
            self.navigationController = UINavigationController(rootViewController: viewController)
        }
    }
    
    func displayDetailViewController(with repository: Repository) -> Void {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let dependencyInjector = appDelegate?.contactListDependencyInjector
        
        if let contactDetailViewController = dependencyInjector?.createContactDetailViewController(
            with: repository,
            routing: self) {
            self.pushViewController(contactDetailViewController)
        }
    }
}
