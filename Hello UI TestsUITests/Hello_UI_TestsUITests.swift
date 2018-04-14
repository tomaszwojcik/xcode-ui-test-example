//
//  Hello_UI_TestsUITests.swift
//  Hello UI TestsUITests
//
//  Created by Tomasz Wójcik on 11/04/2018.
//  Copyright © 2018 Tomasz Wójcik. All rights reserved.
//

import XCTest

class Hello_UI_TestsUITests: XCTestCase {
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments += ["UI-TESTING"]
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLoginWithEmptyCredentials() {
        // Given
        app.launch()

        // When
        let loginButton = app.buttons["Log in"]
        loginButton.tap()

        // Then
        let error = app.staticTexts["Cannot be blank"]
        XCTAssertTrue(error.exists)
    }

    func testLoginWithInvalidCredentials() {
        // Given
        app.launchEnvironment["authenticationServiceResult"] = "false"
        app.launch()

        // When
        let emailTextField = app.textFields["E-mail"]
        emailTextField.tap()
        emailTextField.typeText("invalid_user")

        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("secret")

        app.buttons["Log in"].tap()

        // Then
        let error = app.staticTexts["Invalid credentials"]
        XCTAssertTrue(error.exists)
    }

    func testSuccessfulLogin() {
        // Given
        app.launchEnvironment["authenticationServiceResult"] = "true"
        app.launch()

        // When
        let emailTextField = app.textFields["E-mail"]
        emailTextField.tap()
        emailTextField.typeText("user@domain.com")

        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("secret")

        app.buttons["Log in"].tap()

        // Then
        let loggedInMessage = app.staticTexts["Logged in!"]
        XCTAssertTrue(loggedInMessage.exists)
    }
}
