// AuthViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран авторизации
final class AuthViewController: UIViewController {
    // MARK: - Private Properties

    private let secureEntryImage = UIImage(systemName: "eye.slash.fill")?.withRenderingMode(.alwaysOriginal)
    private let nonSecureEntryImage = UIImage(systemName: "eye.fill")?.withRenderingMode(.alwaysOriginal)
    private var isPasswordSecured: Bool = true {
        didSet {
            let image = isPasswordSecured ? secureEntryImage : nonSecureEntryImage
            secureEntryButton.setImage(image?.withTintColor(.gray), for: .normal)
            passwordTextField.isSecureTextEntry = isPasswordSecured
        }
    }

    private lazy var brownBackgroundView = BrownBackgroundView(frame: view.bounds, yLogoPosition: 103)
    private lazy var whiteView = view.createWhiteView()
    private lazy var authLabel = view.createBlackVerdanaLabel(size: 26, text: "Авторизация", yPosition: 32)
    private lazy var logiLabel = view.createBlackVerdanaLabel(size: 16, text: "Логин", yPosition: 84)
    private lazy var passwordLabel = view.createBlackVerdanaLabel(size: 16, text: "Пароль", yPosition: 159)
    private lazy var loginTextField = view.createCustomTextField(placeholder: "Введите почту", yPosition: 113)
    private lazy var passwordTextField = view.createCustomTextField(placeholder: "Введите пароль", yPosition: 188)
    private lazy var loginButton = GreenButtonView(
        title: "Войти",
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

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupSubViews()
        configureSubviews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loginTextField.becomeFirstResponder()
    }

    // MARK: - Private Methods

    private func setupSubViews() {
        view.addSubViews(brownBackgroundView, whiteView, loginButton)
        whiteView.addSubViews(authLabel, logiLabel, loginTextField, passwordLabel, passwordTextField)
    }

    private func configureSubviews() {
        loginTextField.textContentType = .emailAddress
        passwordTextField.textContentType = .password
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
}
