//
//  ViewController.swift
//  Hello UI Tests
//
//  Created by Tomasz Wójcik on 11/04/2018.
//  Copyright © 2018 Tomasz Wójcik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private lazy var authenticationService: AuthenticationService = {
        return AppDelegate.bootstrap.createAuthenticationService()
    }()

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var emailHintLabel: UILabel!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var passwordHintLabel: UILabel!

    @IBAction func performLogin(_ sender: UIButton) {
        sender.isEnabled = false
        defer { sender.isEnabled = true }
        resetHints()
        guard validateFields() else { return }
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        validateCredentials(email: email, password: password) { [weak self] isSuccess in
            guard let strongSelf = self else { return }

            if isSuccess {
                strongSelf.performSegue(withIdentifier: "showLoggedInScreen", sender: nil)
            } else {
                strongSelf.showPasswordHint(message: "Invalid credentials")
            }
        }
    }

    private func resetHints() {
        UIView.animate(withDuration: 0.25) {
            self.emailHintLabel.isHidden = true
            self.passwordHintLabel.isHidden = true
        }
    }

    private func validateFields() -> Bool {
        var result = true
        if emailTextField.text!.isEmpty {
            showEmailHint(message: "Cannot be blank")
            result = false
        }

        if passwordTextField.text!.isEmpty {
            showPasswordHint(message: "Cannot be blank")
            result = false
        }
        return result
    }

    private func validateCredentials(email: String,
                                     password: String,
                                     completion: @escaping (Bool) -> Void) {
        authenticationService.authenticate(email: email, password: password, completion: completion)
    }

    private func showEmailHint(message: String) {
        UIView.animate(withDuration: 0.25) {
            self.emailHintLabel.text = message
            self.emailHintLabel.isHidden = false
        }
    }

    private func showPasswordHint(message: String) {
        UIView.animate(withDuration: 0.25) {
            self.passwordHintLabel.text = message
            self.passwordHintLabel.isHidden = false

        }
    }
}
