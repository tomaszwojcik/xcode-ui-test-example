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
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLoginWithEmptyCredentials() {
        let loginButton = app.buttons["Log in"]
        loginButton.tap()

        let error = app.staticTexts["Cannot be blank"]
        XCTAssertTrue(error.exists)
    }

    func testLoginWithInvalidCredentials() {
        let emailTextField = app.textFields["E-mail"]
        emailTextField.tap()
        emailTextField.typeText("invalid_user")

        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("secret")

        app.buttons["Log in"].tap()
        let error = app.staticTexts["Invalid credentials"]
        XCTAssertTrue(error.exists)
    }

    func testSuccessfulLogin() {
        let emailTextField = app.textFields["E-mail"]
        emailTextField.tap()
        emailTextField.typeText("user")

        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("secret")

        app.buttons["Log in"].tap()

        let loggedInMessage = app.staticTexts["Logged in!"]
        XCTAssertTrue(loggedInMessage.exists)
    }
}
