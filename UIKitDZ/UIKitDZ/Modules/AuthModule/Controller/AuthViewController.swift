// AuthViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Authorization screen
final class AuthViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        enum Image {
            static let eyeSlash = "eye.slash.fill"
            static let eye = "eye.fill"
        }

        enum Size {
            static let bottomViewHeight: CGFloat = 564
            static let smallLabel: CGFloat = 16
            static let bigLabel: CGFloat = 26
        }

        enum Text {
            static let auth = "Авторизация"
            static let login = "Логин"
            static let password = "Пароль"
            static let enterEmail = "Введите почту"
            static let enterPassword = "Введите пароль"
            static let checkIn = "Войти"
        }
    }

    // MARK: - Visual Components

    private lazy var brownBackgroundView = BrownBackgroundView(frame: view.bounds, yLogoPosition: 103)
    private lazy var whiteBottomView = view.makeBottomWhiteView(height: Constants.Size.bottomViewHeight)
    private lazy var authLabel = view.makeBlackVerdanaLabel(
        size: Constants.Size.bigLabel,
        text: Constants.Text.auth,
        yPosition: 32
    )
    private lazy var logiLabel = view.makeBlackVerdanaLabel(
        size: Constants.Size.smallLabel,
        text: Constants.Text.login,
        yPosition: 84
    )
    private lazy var passwordLabel = view.makeBlackVerdanaLabel(
        size: Constants.Size.smallLabel,
        text: Constants.Text.password,
        yPosition: 159
    )
    private lazy var loginTextField = view.createCustomTextField(
        placeholder: Constants.Text.enterEmail,
        yPosition: 113
    )
    private lazy var passwordTextField = view.createCustomTextField(
        placeholder: Constants.Text.enterPassword,
        yPosition: 188
    )
    private lazy var loginButton = MintColorBottomButton(
        title: Constants.Text.checkIn,
        parent: self.view,
        action: #selector(navigateToMenuVC),
        isEnabled: true
    )
    private lazy var secureEntryButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = secureEntryImage?.withTintColor(.gray)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(changePasswordSecureState), for: .touchUpInside)
        button.sizeToFit()
        return button
    }()

    // MARK: - Private Properties

    private let secureEntryImage = UIImage(systemName: Constants.Image.eyeSlash)?.withRenderingMode(.alwaysOriginal)
    private let nonSecureEntryImage = UIImage(systemName: Constants.Image.eye)?.withRenderingMode(.alwaysOriginal)
    private var isPasswordSecured: Bool = true {
        didSet {
            let image = isPasswordSecured ? secureEntryImage : nonSecureEntryImage
            secureEntryButton.setImage(image?.withTintColor(.gray), for: .normal)
            passwordTextField.isSecureTextEntry = isPasswordSecured
        }
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        configureSubviews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setInitialAppearance()
    }

    // MARK: - Private Methods

    private func setupSubViews() {
        view.addSubViews(brownBackgroundView, whiteBottomView, loginButton)
        whiteBottomView.addSubViews(authLabel, logiLabel, loginTextField, passwordLabel, passwordTextField)
    }

    private func configureSubviews() {
        view.backgroundColor = .systemBackground
        loginTextField.textContentType = .emailAddress
        loginTextField.keyboardType = .emailAddress
        loginTextField.delegate = self
        passwordTextField.textContentType = .password
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = isPasswordSecured
        passwordTextField.rightView = secureEntryButton
        passwordTextField.rightViewMode = .always
    }

    @objc private func navigateToMenuVC() {
        let menuVC = UINavigationController(rootViewController: MenuViewController())
        menuVC.modalPresentationStyle = .fullScreen
        present(menuVC, animated: true)
    }

    @objc private func changePasswordSecureState() {
        isPasswordSecured.toggle()
    }

    private func setInitialAppearance() {
        loginTextField.becomeFirstResponder()
        loginTextField.text = ""
        passwordTextField.text = ""
        loginButton.isEnabled = false
    }
}

// MARK: - UITextFieldDelegate

extension AuthViewController: UITextFieldDelegate {
    // Check password length and email length and show/hide corresponding UI
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let additionalValue = (string.isEmpty) ? -1 : 1
        var emailLength = loginTextField.text?.count ?? 0
        var passwordLength = passwordTextField.text?.count ?? 0
        if textField == loginTextField {
            emailLength += additionalValue
        } else {
            passwordLength += additionalValue
        }

        guard emailLength > 0, passwordLength > 0 else {
            loginButton.isEnabled = false
            return true
        }
        loginButton.isEnabled = true
        return true
    }
}
