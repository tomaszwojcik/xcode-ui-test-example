//
//  FakeAuthenticationService.swift
//  Hello UI Tests
//
//  Created by Tomasz Wójcik on 14/04/2018.
//  Copyright © 2018 Tomasz Wójcik. All rights reserved.
//

import Foundation

class FakeAuthenticationService: AuthenticationService {
    func authenticate(email: String, password: String, completion: (Bool) -> Void) {
        completion(environomentResult)
    }

    private var environomentResult: Bool {
        let value = ProcessInfo.processInfo.environment["authenticationServiceResult"] ?? "true"
        return (value as NSString).boolValue
    }
}
