//
//  AuthenticationService.swift
//  Hello UI Tests
//
//  Created by Tomasz Wójcik on 14/04/2018.
//  Copyright © 2018 Tomasz Wójcik. All rights reserved.
//

import Foundation

protocol AuthenticationService: class {
    func authenticate(email: String, password: String, completion: (Bool) -> Void)
}
