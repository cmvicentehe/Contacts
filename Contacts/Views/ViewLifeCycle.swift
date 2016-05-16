//
//  ViewLyfeCycle.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 16/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import Foundation

@objc protocol ViewLifeCycle {
    
    optional func viewWillAppeared() -> Void
    optional func viewDidAppeared() -> Void
    optional func viewDidLoaded() -> Void
    optional func viewWillDissapeared() -> Void
    optional func viewDidDissapeared() -> Void
}