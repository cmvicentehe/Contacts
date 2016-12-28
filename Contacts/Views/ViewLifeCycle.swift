//
//  ViewLyfeCycle.swift
//  Contacts
//
//  Created by Carlos M. Vicente Herrero on 16/5/16.
//  Copyright © 2016 Carlos M. Vicente Herrero. All rights reserved.
//

import Foundation

@objc protocol ViewLifeCycle {
    @objc optional func viewWillAppeared() -> Void
    @objc optional func viewDidAppeared() -> Void
    @objc optional func viewDidLoaded() -> Void
    @objc optional func viewWillDissapeared() -> Void
    @objc optional func viewDidDissapeared() -> Void
}
