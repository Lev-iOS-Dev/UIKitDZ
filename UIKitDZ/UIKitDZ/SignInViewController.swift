//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Levon Shaxbazyan on 10.02.24.
//

import UIKit

/// Стартовый вью контроллер
class SignInViewController: UIViewController {
    // MARK: - Private Properties
    private var birthdayImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "birthDay")
        return view
    }()
    private var birthDayLabel: UILabel = {
        let label = UILabel()
        label.text = "Birthday\nReminder"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor(hex: "#5A4394")
        return label
    }()
    private var signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in"
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.textColor = UIColor(hex: "#E9465E")
        return label
    }()
    private var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hex: "#E9465E")
        return label
    }()
    private var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Typing email"
        textField.font = .systemFont(ofSize: 14)
        return textField
    }()
    private var emailLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#D0D6DC")
        return view
    }()
    private var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hex: "#E9465E")
        return label
    }()
    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Typing password"
        textField.font = .systemFont(ofSize: 14)
        return textField
    }()
    private var passwordLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#D0D6DC")
        return view
    }()
    private var passwordVisibilityButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "passwordUnvisible"), for: .normal)
        return button
    }()
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hex: "#F6B5BF")
        button.setTitleColor(UIColor(hex: "#FFFEFE"), for: .normal)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 12
        return button
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureSubviews()
    }
    // MARK: - Private Methods
        private func setupSubviews() {
            view.addSubviews([
                birthdayImageView,
                birthDayLabel,
                signInLabel,
                emailLabel,
                emailTextField,
                emailLineView,
                passwordLabel,
                passwordTextField,
                passwordLineView,
                passwordVisibilityButton,
                loginButton
            ])
        }
        private func configureSubviews() {
            birthdayImageView.frame = CGRect(
                x: 125, y: 70, width: 125, height: 125)
            birthDayLabel.frame = CGRect(
                x: 100, y: 200, width: 175, height: 44)
            signInLabel.frame = CGRect(
                x: 20, y: 266, width: 175, height: 31)
            emailLabel.frame = CGRect(
                x: 20, y: 318, width: 175, height: 19)
            emailTextField.frame = CGRect(
                x: 20, y: 347, width: 175, height: 17)
            emailLineView.frame = CGRect(
                x: 20, y: 372, width: 335, height: 2)
            passwordLabel.frame = CGRect(
                x: 20, y: 393, width: 175, height: 19)
            passwordTextField.frame = CGRect(
                x: 20, y: 422, width: 175, height: 17)
            passwordLineView.frame = CGRect(
                x: 20, y: 448, width: 335, height: 2)
            passwordVisibilityButton.frame = CGRect(
                x: 331, y: 416, width: 24, height: 24)
            loginButton.frame = CGRect(
                x: 20, y: 671, width: 335, height: 44)
        }
}
