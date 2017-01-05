//
//  Routing.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 15/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import UIKit

protocol Routing {
    func displayInitialViewController(_ viewController: UIViewController) -> Void
    func pushViewController(_ viewController: UIViewController) -> Void
}
