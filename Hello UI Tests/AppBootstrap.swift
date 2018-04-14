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
        // This is a bad practice, production code shouldn't be *aware* of tests/testing environment
        // However I haven't found any other way to pass data (like stubs) from UI tests
        if isTestingUI() {
            return FakeAuthenticationService()
        }
        return DefaultAuthenticationService()
    }
}

