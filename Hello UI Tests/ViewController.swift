//
//  ViewController.swift
//  Hello UI Tests
//
//  Created by Tomasz Wójcik on 11/04/2018.
//  Copyright © 2018 Tomasz Wójcik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var emailHintLabel: UILabel!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var passwordHintLabel: UILabel!

    @IBAction func performLogin(_ sender: UIButton) {
        sender.isEnabled = false
        defer {
            print("Enabling button")
            sender.isEnabled = true
        }
        resetHints()
        guard validateFields() else { return }
        if validateCredentials() {
            performSegue(withIdentifier: "showLoggedInScreen", sender: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    private func validateCredentials() -> Bool {
        if emailTextField.text == "user" && passwordTextField.text == "secret" {
            return true

        } else {
            showPasswordHint(message: "Invalid credentials")
            return false
        }
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
