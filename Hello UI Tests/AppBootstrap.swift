//
//  AppBootstrap.swift
//  Hello UI Tests
//
//  Created by Tomasz Wójcik on 14/04/2018.
//  Copyright © 2018 Tomasz Wójcik. All rights reserved.
//

import Foundation

class AppBootstrap {
    func createAuthenticationService() -> AuthenticationService {
        if isTestingUI() {
            return FakeAuthenticationService()
        }
        return DefaultAuthenticationService()
    }
}

