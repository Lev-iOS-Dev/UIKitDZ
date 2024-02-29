// AuthViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый вью контроллер

/// Протокол для общения с AuthViewController
protocol AuthViewControllerProtocol: AnyObject {
    /// Обновляет UI элементы с почтой
    func updateUIForEmail(isValid: Bool)
    /// Обновляет UI элементы с паролем
    func updateUIForPassword(isValid: Bool)
}

/// Экран для авторизаци пользователя
final class AuthViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        enum Insets {
            static let vInset: CGFloat = 23
            static let smallInset: CGFloat = 6
            static let top: CGFloat = 32
            static let bottom: CGFloat = -32
            static let left: CGFloat = 20
            static let right: CGFloat = -20
            static let iconWidth: CGFloat = 20
            static let leftViewWidth: CGFloat = 46
            static let rightViewWidth: CGFloat = 40
            static let errorLabelWidth: CGFloat = 230
            static let errorLabelHeight: CGFloat = 19
            static let labelHeight: CGFloat = 32
            static let warningLabelHeight: CGFloat = 87
            static let textFieldHeight: CGFloat = 50
            static let buttonHeight: CGFloat = 48
            static let smallVInset: CGFloat = 12
            static let cornerRadius: CGFloat = 12
            static let loginButtonBottom: CGFloat = 200
        }

        enum Texts {
            static let loginLabel = "Login"
            static let emailLabel = "Email Address"
            static let emailPlaceholder = "Enter Email Address"
            static let emailErrorLabel = "Incorrect format"
            static let passwordLabel = "Password"
            static let passwordPlaceholder = "Enter Password"
            static let passwordErrorLabel = "You entered the wrong password"
            static let loginButton = "Login"
            static let warningLabel = "Please check the accuracy of the\nentered credentials."
        }
    }

    // MARK: Public Properties

    var presenter: AuthPresenterProtocol?

    // MARK: - Visual Components

    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Texts.loginLabel
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .loginLabelForeground
        return label
    }()

    private lazy var emailLabel = makeLabelWith(
        title: Constants.Texts.emailLabel
    )

    private lazy var emailTextField = makeTextfFieldWith(
        placeholder: Constants.Texts.emailPlaceholder,
        leftIcon: .emailIcon,
        rightIcon: nil
    )

    private lazy var emailErrorLabel = makeErrorLabelWith(
        text: Constants.Texts.emailErrorLabel
    )

    private lazy var passwordLabel = makeLabelWith(
        title: Constants.Texts.passwordLabel
    )

    private lazy var passwordTextField = makeTextfFieldWith(
        placeholder: Constants.Texts.passwordLabel,
        leftIcon: .passwordIcon,
        rightIcon: .passwordInvisible
    )

    private lazy var passwordVisibilityButton: UIButton = {
        let button = UIButton()
        button.setImage(.passwordInvisible, for: .normal)
        button.addTarget(
            self,
            action: #selector(didTapPasswordVisibilityButton(_:)),
            for: .touchUpInside
        )
        return button
    }()

    private lazy var passwordErrorLabel = makeErrorLabelWith(
        text: Constants.Texts.passwordErrorLabel
    )

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.Texts.loginButton, for: .normal)
        button.backgroundColor = .loginButtonBackground
        button.layer.cornerRadius = 12
        button.addTarget(
            self,
            action: #selector(didTapLoginButton(_:)),
            for: .touchUpInside
        )
        return button
    }()

    private let warningLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = Constants.Texts.warningLabel
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.backgroundColor = .warningBackground
        label.textColor = .white
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        configureSubviews()
        setupGestureRecognizerFor(view: view)
        setupKeyboardAppearance()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupStartPosition()
        makeAnimationAppearance()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupGradientLayer()
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        view.addSubviews([
            loginLabel,
            emailLabel,
            emailTextField,
            emailErrorLabel,
            passwordLabel,
            passwordTextField,
            passwordErrorLabel,
            loginButton,
            warningLabel
        ])
        passwordVisibilityButton.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.addSubview(passwordVisibilityButton)
        emailTextField.delegate = self
        passwordTextField.delegate = self
        view.backgroundColor = .authBackground
    }

    private func configureSubviews() {
        configureLoginLabel()
        configureEmailLabel()
        configureEmailTextField()
        configureEmailErrorLabel()
        configurePasswordLabel()
        configurePasswordTextField()
        configurePasswordErrorLabel()
        configureLoginButton()
        configurePasswordVisibilityButton()
        configureWarningLabel()
    }

    private func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(.gradientStart).cgColor,
            UIColor(.gradientEnd).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    private func setupStartPosition() {
        emailLabel.center = CGPoint(
            x: -emailLabel.frame.width / 2,
            y: view.center.y
        )
        emailTextField.center = CGPoint(
            x: -emailTextField.frame.width / 2,
            y: view.center.y
        )
        passwordLabel.center = CGPoint(
            x: view.frame.width + passwordLabel.frame.width / 2,
            y: view.center.y
        )
        passwordTextField.center = CGPoint(
            x: view.frame.width + passwordTextField.frame.width / 2,
            y: view.center.y
        )
    }

    private func makeAnimationAppearance() {
        UIView.animate(withDuration: 1.0) {
            self.emailLabel.center = CGPoint(
                x: self.view.frame.size.width / 2,
                y: self.view.center.y
            )
            self.emailTextField.center = CGPoint(
                x: self.view.frame.size.width / 2,
                y: self.view.center.y
            )
            self.passwordLabel.center = CGPoint(
                x: self.view.frame.size.width / 2,
                y: self.view.center.y
            )
            self.passwordTextField.center = CGPoint(
                x: self.view.frame.size.width / 2,
                y: self.view.center.y
            )
        }
    }

    private func makeLabelWith(title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .loginLabelForeground
        return label
    }

    private func makeTextfFieldWith(
        placeholder: String,
        leftIcon: UIImage,
        rightIcon: UIImage?
    ) -> UITextField {
        // setup LeftView
        let textField = UITextField()
        let leftView = addLeftViewWith(
            image: leftIcon, in: textField
        )
        textField.leftView = leftView
        textField.leftViewMode = .always

        // setup textField
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.textFieldBorder.cgColor
        textField.layer.borderWidth = 2
        textField.placeholder = placeholder
        textField.layer.cornerRadius = Constants.Insets.cornerRadius

        return textField
    }

    private func makeErrorLabelWith(text: String) -> UILabel {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = text
        label.textColor = .clear
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }

    private func toggleSecurityStateIn(textField: UITextField) {
        textField.isSecureTextEntry.toggle()

        let image: UIImage = textField.isSecureTextEntry
            ? .passwordInvisible
            : .passwordVisible
        passwordVisibilityButton.setImage(image, for: .normal)
    }

    private func setupKeyboardAppearance() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    @objc func didTapPasswordVisibilityButton(_ sender: UIButton) {
        toggleSecurityStateIn(textField: passwordTextField)
    }

    @objc func didTapLoginButton(_ sender: UIButton) {
        loginButton.setTitle("", for: .normal)
        loginButton.setImage(
            UIImage(systemName: "circle.hexagonpath"),
            for: .normal
        )
        UIView.animate(withDuration: 3.0) {
            sender.imageView?.transform = CGAffineTransform(
                rotationAngle: CGFloat.pi
            )
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.animate(withDuration: 1.0) {
                self.warningLabel.isHidden = false
            }
        }
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        loginButton.translatesAutoresizingMaskIntoConstraints = true
        loginButton.frame.origin.y = passwordErrorLabel.frame.origin.y + 40
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.frame.origin.y = view.frame.size.height - Constants.Insets.loginButtonBottom
    }
}

/// Расширение для конфигурации вьюшек
extension AuthViewController {
    private func configureLoginLabel() {
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.Insets.top
            ),
            loginLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.right
            ),
            loginLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.left
            ),
            loginLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.labelHeight
            )
        ])
    }

    private func configureEmailLabel() {
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(
                equalTo: loginLabel.bottomAnchor,
                constant: Constants.Insets.vInset
            ),
            emailLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.right
            ),
            emailLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.left
            ),
            emailLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.labelHeight
            )
        ])
    }

    private func configureEmailTextField() {
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(
                equalTo: emailLabel.bottomAnchor,
                constant: Constants.Insets.smallInset
            ),
            emailTextField.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.right
            ),
            emailTextField.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.left
            ),
            emailTextField.heightAnchor.constraint(
                equalToConstant: Constants.Insets.textFieldHeight
            )
        ])
    }

    private func configureEmailErrorLabel() {
        NSLayoutConstraint.activate([
            emailErrorLabel.topAnchor.constraint(
                equalTo: emailTextField.bottomAnchor
            ),
            emailErrorLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.left
            ),
            emailErrorLabel.widthAnchor.constraint(
                equalToConstant: Constants.Insets.errorLabelWidth
            ),
            emailErrorLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.errorLabelHeight
            )
        ])
    }

    private func configurePasswordLabel() {
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(
                equalTo: emailTextField.bottomAnchor,
                constant: Constants.Insets.vInset
            ),
            passwordLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.right
            ),
            passwordLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.left
            ),
            passwordLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.labelHeight
            )
        ])
    }

    private func configurePasswordTextField() {
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(
                equalTo: passwordLabel.bottomAnchor,
                constant: Constants.Insets.smallInset
            ),
            passwordTextField.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.right
            ),
            passwordTextField.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.left
            ),
            passwordTextField.heightAnchor.constraint(
                equalToConstant: Constants.Insets.textFieldHeight
            )
        ])
        passwordTextField.isSecureTextEntry = true
    }

    private func configurePasswordErrorLabel() {
        NSLayoutConstraint.activate([
            passwordErrorLabel.topAnchor.constraint(
                equalTo: passwordTextField.bottomAnchor
            ),
            passwordErrorLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.left
            ),
            passwordErrorLabel.widthAnchor.constraint(
                equalToConstant: Constants.Insets.errorLabelWidth
            ),
            passwordErrorLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.errorLabelHeight
            )
        ])
    }

    private func configureLoginButton() {
        NSLayoutConstraint.activate([
            loginButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: Constants.Insets.bottom
            ),
            loginButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.right
            ),
            loginButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.left
            ),
            loginButton.heightAnchor.constraint(
                equalToConstant: Constants.Insets.buttonHeight
            )
        ])
    }

    private func configurePasswordVisibilityButton() {
        NSLayoutConstraint.activate([
            passwordVisibilityButton.centerYAnchor.constraint(
                equalTo: passwordTextField.centerYAnchor
            ),
            passwordVisibilityButton.trailingAnchor.constraint(
                equalTo: passwordTextField.trailingAnchor,
                constant: Constants.Insets.right
            ),
            passwordVisibilityButton.widthAnchor.constraint(
                equalToConstant: 20
            ),
            passwordVisibilityButton.heightAnchor.constraint(
                equalToConstant: 20
            )
        ])
    }

    private func configureWarningLabel() {
        NSLayoutConstraint.activate([
            warningLabel.bottomAnchor.constraint(
                equalTo: loginButton.bottomAnchor,
                constant: -Constants.Insets.vInset
            ),
            warningLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.left
            ),
            warningLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.right
            ),
            warningLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.warningLabelHeight
            )
        ])
    }
}

/// Rасширение для добавления textfield-у leftView и rightView
extension AuthViewController {
    private func addLeftViewWith(image: UIImage, in textField: UITextField) -> UIView {
        let leftViewContainer = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: Constants.Insets.leftViewWidth,
                height: textField.frame.size.height
            )
        )
        let leftView = UIImageView(image: image)
        leftView.frame = CGRect(
            x: 16,
            y: 0,
            width: Constants.Insets.iconWidth,
            height: textField.frame.size.height
        )
        leftView.contentMode = .center
        leftViewContainer.addSubview(leftView)

        return leftViewContainer
    }
}

/// расширение для закрытия клавиатуры при тапе на вью
extension AuthViewController {
    private func setupGestureRecognizerFor(view: UIView) {
        let gestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(onTapGesture(_:))
        )
        view.addGestureRecognizer(gestureRecognizer)
    }

    @objc private func onTapGesture(_ sender: UIGestureRecognizer) {
        view.endEditing(true)
    }
}

// MARK: - AuthViewController + UITextFieldDelegate

extension AuthViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return true }

        switch textField {
        case emailTextField:
            presenter?.checkValidationOf(email: text)
        case passwordTextField:
            presenter?.checkValidationOf(password: text)
        default:
            break
        }

        view.endEditing(true)
        return true
    }
}

// MARK: - AuthViewController + AuthViewControllerProtocol

extension AuthViewController: AuthViewControllerProtocol {
    func updateUIForEmail(isValid: Bool) {
        if isValid {
            emailErrorLabel.textColor = .clear
            emailLabel.textColor = .black
            emailTextField.layer.borderColor = UIColor.textFieldBorder.cgColor
        } else {
            emailErrorLabel.textColor = .errorLabelForeground
            emailLabel.textColor = .errorLabelForeground
            emailTextField.layer.borderColor = UIColor.errorLabelForeground.cgColor
        }
    }

    func updateUIForPassword(isValid: Bool) {
        if isValid {
            passwordErrorLabel.textColor = .clear
            passwordLabel.textColor = .black
            passwordTextField.layer.borderColor = UIColor.textFieldBorder.cgColor
        } else {
            passwordErrorLabel.textColor = .errorLabelForeground
            passwordLabel.textColor = .errorLabelForeground
            passwordTextField.layer.borderColor = UIColor.errorLabelForeground.cgColor
        }
    }
}
