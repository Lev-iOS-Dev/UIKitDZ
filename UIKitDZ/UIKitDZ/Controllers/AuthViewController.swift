//
//  AuthViewController.swift
//  UIKitDZ
//
//  Created by Levon Shaxbazyan on 10.02.24.
//

import UIKit

/// Страница авторизации
class AuthViewController: UIViewController {
    static var email = ""
    // MARK: - IBOutlets
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var isPasswordVisibleButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeInitialSetup()
    }
    // MARK: - IBActions
    @IBAction func changePasswordVisibilityButton(_ sender: UIButton) {
        self.passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry
        ? "password_unvisible"
        : "password_visible"
        self.isPasswordVisibleButton.setImage(UIImage(named: imageName), for: .normal)
    }
    @IBAction func didTapLoginButton(_ sender: UIButton) { }
    // MARK: - Private Methods
    private func makeInitialSetup() {
        view.backgroundColor = .white
        logInButton.isUserInteractionEnabled = false
        passwordTextField.isSecureTextEntry = true
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
}
// MARK: - Extensions
extension AuthViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let login = loginTextField.text,
              let password = passwordTextField.text else { return }
        if !login.isEmpty && !password.isEmpty {
            self.logInButton.isUserInteractionEnabled = true
            self.logInButton.backgroundColor = UIColor(hex: "#16BDCD")
        } else {
            self.logInButton.isUserInteractionEnabled = false
            self.logInButton.backgroundColor = UIColor(hex: "#8ADEE6")
        }
        AuthViewController.email = login
    }
}
